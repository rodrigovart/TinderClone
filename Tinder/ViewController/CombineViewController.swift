//
//  CombineViewController.swift
//  Tinder
//
//  Created by Rodrigo Vart on 27/02/22.
//

import UIKit
import SwiftMessages

enum Action {
    case like
    case deslike
    case superlike
}

class CombineViewController: UIViewController {
    
    var loading = LoadingView()
    
    var users: [User] = []
    var quotes: [Quote] = []
    let phrase = "Gosto de gatos e cachorros 🙀🐶🐾"
    
    var buttonProfile: UIButton = .iconHeader(named: "icone-perfil")
    var buttonMessage: UIButton = .iconHeader(named: "icone-chat")
    var buttonLogo: UIButton = .iconHeader(named: "icone-logo")
    
    var buttonDeslike: UIButton = .iconFooter(named: "icone-deslike")
    var buttonSuperlike: UIButton = .iconFooter(named: "icone-superlike")
    var buttonLike: UIButton = .iconFooter(named: "icone-like")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.systemGroupedBackground
  
        loading = LoadingView(frame: view.frame)
        view.insertSubview(loading, at: 0)
        
        getUsers()
        getQuotes()
        
        addHeaders()
        addFooter()
    }
    
    func getUsers() {
        UserService.shared.searchUsers { result in
            self.users.append(contentsOf: result)
        }
    }
    
    func getQuotes() {
        QuoteService.shared.searchQuotes { result in
            self.quotes.append(contentsOf: result)
            self.addCards()
        }
    }
}


extension CombineViewController {
    func addHeaders() {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let topView: CGFloat = window?.safeAreaInsets.top ?? 44
        
        
        let stackView = UIStackView(arrangedSubviews: [buttonProfile, buttonMessage, buttonLogo])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.fillView(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: topView, left: 16, bottom: 0, right: -16)
        )
    }
}

extension CombineViewController {
    func addCards() {
        var index = 0
        
        for var user in users {
            let cardView = CombineCardView()
            
            cardView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            cardView.center = view.center
            
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlerCard))
            
            cardView.addGestureRecognizer(gesture)
            
            user.id = index
            user.photo = "pessoa-\(index+1)"
            user.phrase = quotes[index].content
            
            cardView.user = user
            cardView.tag = index
            users[index].photo = "pessoa-\(index+1)"
            users[index].id = index
            
            cardView.callback = { (result) in
                self.showDetailsUser(user)
            }
            
            view.addSubview(cardView)
            
            index += 1
        }
    }
    
    func removeCard(_ card: CombineCardView) {
        card.removeFromSuperview()
        users = users.filter({ (user) -> Bool in
            return user.id != card.tag
        })
    }
    
    @objc func handlerCard(_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view as? CombineCardView {
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            if point.x > 0 {
                card.iconLike.alpha = rotationAngle * 5
                card.iconDeslike.alpha = 0
            } else{
                card.iconDeslike.alpha = (rotationAngle * 5) * -1
                card.iconLike.alpha = 0
            }
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended {
                
                if card.center.x > view.bounds.width + 50 {
                    animateCard(rotationAngle, .like)
                    return
                }
                
                if card.center.x < -50 {
                    animateCard(rotationAngle, .deslike)
                    return
                }
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    card.iconLike.alpha = 0
                    card.iconDeslike.alpha = 0
                }
            }
        }
    }
}

extension CombineViewController {
    func addFooter() {
        let stackView = UIStackView(arrangedSubviews: [UIView(), buttonDeslike, buttonSuperlike, buttonLike, UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.fillView(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: -30, right: -16)
        )
        
        addTapButtons()
    }
    
    func addTapButtons() {
        buttonDeslike.addTarget(self, action: #selector(deslike), for: .touchUpInside)
        buttonSuperlike.addTarget(self, action: #selector(superLike), for: .touchUpInside)
        buttonLike.addTarget(self, action: #selector(like), for: .touchUpInside)
    }
    
    @objc func deslike() {
        animateCard(-0.4, .deslike)
    }
    
    @objc func superLike() {
        animateCard(-0.4, .superlike)
    }
    
    @objc func like() {
        animateCard(-0.4, .like)
    }
}

extension CombineViewController {
    func animateCard(_ rotationAngle: CGFloat, _ action: Action) {
        if let user = users.last {
            for view in self.view.subviews {
                if view.tag == user.id {
                    if let card = view as? CombineCardView {
                        let center: CGPoint
                        let viewFrame = self.view.bounds
                        let cardCenterY = card.center.y + 50
                        
                        switch action {
                        case .like:
                            center = CGPoint(x: card.center.x + viewFrame.width, y: cardCenterY)
                        case .deslike:
                            center = CGPoint(x: card.center.x - viewFrame.width, y: cardCenterY)
                        case .superlike:
                            center = CGPoint(x: card.center.x, y: card.center.y - viewFrame.height)
                        }
                        
                        UIView.animate(withDuration: 0.4) {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                        } completion: { _ in
                            self.verifyMatch(user: user)
                            self.removeCard(card)
                        }
                    }
                }
            }
        }
    }
    
    func verifyMatch(user: User) {
        let match = Bool.random()
        
        if match {
            // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
            // files in the main bundle first, so you can easily copy them into your project and make changes.
            let view = MessageView.viewFromNib(layout: .centeredView)

            // Theme message elements with the warning style.
            view.configureTheme(.success)

            // Add a drop shadow.
            view.configureDropShadow()

            // Set message title, body, and icon. Here, we're overriding the default warning
            // image with an emoji character.
            view.configureContent(title: "IT`S A MATCH", body: "", iconText: "😳")

            // Increase the external margin around the card. In general, the effect of this setting
            // depends on how the given layout is constrained to the layout margins.
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

            // Reduce the corner radius (applicable to layouts featuring rounded corners).
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            view.button?.isHidden = true
            
            // Customize config using the default as a base.
            var config = SwiftMessages.defaultConfig
            config.duration = .seconds(seconds: 2)
           
            // Show the message.
            SwiftMessages.show(config: config, view: view)
            
            let matchVC = MatchViewController()
            matchVC.modalPresentationStyle = .fullScreen
            matchVC.user = user
            
            present(matchVC, animated: true, completion: nil)
        }
    }
}

extension CombineViewController {
    func showDetailsUser(_ user: User) {
        let detailVC = MatchViewController()
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.user = user
        
        present(detailVC, animated: true, completion: nil)
    }
}
