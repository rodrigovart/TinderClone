//
//  DetailHeaderView.swift
//  Tinder
//
//  Created by Rodrigo Vart on 15/04/22.
//

import Foundation
import UIKit

class DetailHeaderView: UICollectionReusableView {
    
    var user: User? {
        didSet{
            if let user = user {
                photo.image = UIImage(named: user.photo ?? "")
            }
        }
    }
    
    let photo: UIImageView = .createUIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photo)
        
        photo.fillSuperView()
        photo.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
