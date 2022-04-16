//
//  CombineCardView.swift
//  Tinder
//  text: "Gosto de gatos e cachorros 🙀🐶🐾"
//  Created by Rodrigo Vart on 27/02/22.
//

import Foundation
import UIKit


class CombineCardView: UIView {

    var user: User? {
        didSet{
            if let user = user {
                photoPerson.image = UIImage(named: user.photo ?? "")
                name.text = user.name.nameComplete
                age.text = "\(user.dob.age)"
                phrase.text = user.phrase
            }
        }
    }

    let photoPerson: UIImageView = .createUIImageView()
    
    let name: UILabel = .textBoldLabel(
        size: 32
    )
    
    let age: UILabel = .textLabel(
        size: 25
    )
    
    let phrase: UILabel = .textLabel(
        size: 15
    )
    
    let iconDeslike: UIImageView = .createUIImageView("card-deslike", .init(width: 70, height: 60), isIcon: true)
    let iconLike: UIImageView = .createUIImageView("card-like", .init(width: 70, height: 60), isIcon: true)

    var callback: ((User) -> Void)?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        name.addShadow()
        age.addShadow()
        phrase.addShadow()
        
        addSubview(photoPerson)
        
        addSubview(iconDeslike)
        
        addSubview(iconLike)
        
        iconDeslike.fillView(
            top: topAnchor,
            leading: nil,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: -20)
        )
        
        iconLike.fillView(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0)
        )
        
        
        photoPerson.fillSuperView()
        
        let nameAgeStackView = UIStackView(arrangedSubviews: [name, age, UIView()])
        nameAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView, phrase])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillView(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: -16, right: -16)
        )
        
        let tapName = UITapGestureRecognizer(target: self, action: #selector(getClick))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tapName)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func getClick() {
        if let user = user {
            callback?(user)
        }
    }
}
