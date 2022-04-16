//
//  DetailPersonCell.swift
//  Tinder
//
//  Created by Rodrigo Vart on 16/04/22.
//

import Foundation
import UIKit

class DetailPersonCell: UICollectionViewCell {
    
    var user: User? {
        didSet{
            if let user = user {
                name.text = user.name.nameComplete
                age.text = "\(user.dob.age)"
                phrase.text = user.phrase
            }
        }
    }
    
    lazy var name: UILabel = .textBoldLabel(size: 32, textColor: .darkGray)
    lazy var age: UILabel = .textBoldLabel(size: 28, textColor: .darkGray)
    lazy var phrase: UILabel = .textBoldLabel(size: 18, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if #available(iOS 15.0, *) {
            backgroundColor = .systemMint
        } else {
            // Fallback on earlier versions
        }
        
        let stackViewNameAge = UIStackView(arrangedSubviews: [name, age, UIView()])
        stackViewNameAge.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [stackViewNameAge, phrase])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.fillSuperView(padding: .init(top: 20, left: 20, bottom: -20, right: -20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
