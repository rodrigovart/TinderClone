//
//  DetailHeaderView.swift
//  Tinder
//
//  Created by Rodrigo Vart on 15/04/22.
//

import Foundation
import UIKit

class DetailHeaderView: UICollectionReusableView {
    
    //delegate
    weak var delegate: DetailsPersonViewController?
    
    var user: User? {
        didSet{
            if let user = user {
                photo.image = UIImage(named: user.photo ?? "")
            }
        }
    }
    
    let photo: UIImageView = .createUIImageView()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icone-down"), for: .normal)
        button.backgroundColor = UIColor(red: 232/255, green: 88/255, blue: 54/255, alpha: 1)
        button.clipsToBounds = true
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photo)
        
        photo.fillSuperView()
        photo.contentMode = .scaleAspectFill
        
        photo.addSubview(backButton)
        backButton.layer.cornerRadius = 24

        backButton.fillView(
            top: nil,
            leading: nil,
            trailing: trailingAnchor,
            bottom: photo.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: -10, right: -16)
        )
        
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        backButton.addTarget(delegate, action: #selector(tapButton), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapButton() {
        delegate?.clickBack()
    }
}
