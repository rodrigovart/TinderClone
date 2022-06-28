//
//  MatchViewController.swift
//  Tinder
//
//  Created by Rodrigo Vart on 13/03/22.
//

import Foundation
import UIKit

class MatchViewController: UIViewController {
    
    var user: User? {
        didSet{
            if let user = user {
                photoPersonMatch.image = UIImage(named: user.photo ?? "pessoa-1")
                message.text = "\(user.name.nameComplete) curtiu você também!"
            }
        }
    }
    
    let photoPersonMatch: UIImageView = .createUIImageView("pessoa-1")
    
    let iconLike: UIImageView = .createUIImageView("icone-like")
    
    let message = UILabel()
    
    let messageTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textfield.placeholder = "Diga algo legal...😃"
        textfield.font = UIFont(name: "Helvetica Neue Medium Extended", size: 15)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 8
        textfield.textColor = .darkText
        textfield.returnKeyType = .go
        
        textfield.leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 16,
            height: 0
        ))
        textfield.leftViewMode = .always
        
        textfield.rightView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 90,
            height: 0
        ))
        textfield.rightViewMode = .always
        
        return textfield
    }()
    
    let buttonSendMessage: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue Medium Extended", size: 15)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        return button
    }()
    
    let buttonCloseView: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "dismissButton"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        photoPersonMatch.layer.addSublayer(gradient)
        
        view.addSubview(photoPersonMatch)
        
        photoPersonMatch.fillSuperView()
        
        message.textColor = .white
        message.font = UIFont(name: "Helvetica Neue Medium Extended", size: 15)
        message.textAlignment = .center
        
        messageTextField.addSubview(buttonSendMessage)
        
        buttonSendMessage.fillView(
            top: messageTextField.topAnchor,
            leading: nil,
            trailing: messageTextField.trailingAnchor,
            bottom: messageTextField.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: -16)
        )
        
        iconLike.translatesAutoresizingMaskIntoConstraints = false
        iconLike.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iconLike.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [iconLike, message, messageTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        
        stackView.fillView(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: -46, right: -32)
        )
        
        view.addSubview(buttonCloseView)
        buttonCloseView.fillView(
            top: view.topAnchor,
            leading: nil,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: UIEdgeInsets(top: 50, left: 0, bottom: -10, right: -10)
        )
    }
    
    @objc func buttonTapped(_ button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func keyboardShow (notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let timeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
                
                UIView.animate(withDuration: timeInterval) {
                    
                    self.view.frame = CGRect(
                        x: UIScreen.main.bounds.origin.x,
                        y: UIScreen.main.bounds.origin.y,
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height - keyboardSize.height
                    )
                    self.view.layoutIfNeeded()
                    
                }
                
            }
        }
    }
    
    @objc func keyboardHide(notification: NSNotification) {
        if let timeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            UIView.animate(withDuration: timeInterval) {
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func sendMessage() {
        if let message = messageTextField.text {
            print(message)
        }
    }
}
