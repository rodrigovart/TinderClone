//
//  DetailPhotosPersonCell.swift
//  Tinder
//
//  Created by Rodrigo Vart on 16/04/22.
//

import Foundation
import UIKit


class DetailPhotosPersonCell: UICollectionViewCell {
    
    let descriptionLabel: UILabel = .textBoldLabel(size: 16, textColor: .darkGray)
    var Instagram: [Instagram] = []
    var photos = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        getInstagramPhotos()
    }
    
    func setupView() {
        descriptionLabel.text = "Fotos recentes Instagram"
        
        addSubview(descriptionLabel)
        descriptionLabel.fillView(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: -20, right: -20)
        )
        
        let sliderVC = SliderPhotosViewController()
        sliderVC.instagramPhotos = Instagram
        
        addSubview(sliderVC.view)
        sliderVC.view.fillView(
            top: descriptionLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor
        )
    }
    
    func getInstagramPhotos() {
        InstagramService.shared.getInstagramMedia { result in
            self.Instagram.append(contentsOf: result)
            self.setupView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
