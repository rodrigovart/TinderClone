//
//  SliderPhotoCell.swift
//  Tinder
//
//  Created by Rodrigo Vart on 01/05/22.
//

import Foundation
import UIKit
import SDWebImage

class SliderPhotoCell: UICollectionViewCell {
    var photo: UIImageView = .createUIImageView()
    var photoMedia = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
   func setupView() {
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
       if #available(iOS 15.0, *) {
           backgroundColor = .systemMint
       } else {
           // Fallback on earlier versions
       }
       
        print(photoMedia)
        
        photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photo.sd_setImage(with: URL(string: photoMedia)) { (image, error, cache, url) in
            if error != nil {
                return
            }
        }
        
        addSubview(photo)
        photo.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
