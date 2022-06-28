//
//  SliderPhotoCell.swift
//  Tinder
//
//  Created by Rodrigo Vart on 01/05/22.
//

import Foundation
import UIKit

class SliderPhotoCell: UICollectionViewCell {
    var photo: UIImageView = .createUIImageView()
    var photoMedia = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
   func setupView() {
        
        layer.cornerRadius = 8
        clipsToBounds = true
    
        addSubview(photo)
        photo.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
