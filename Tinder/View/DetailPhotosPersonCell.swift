//
//  DetailPhotosPersonCell.swift
//  Tinder
//
//  Created by Rodrigo Vart on 16/04/22.
//

import Foundation
import UIKit


class DetailPhotosPersonCell: UICollectionViewCell {
    
    let sliderVC = SliderPhotosViewController()
    let descriptionLabel: UILabel = .textBoldLabel(size: 16, textColor: .darkGray)
    var photos = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        descriptionLabel.text = "Fotos recentes"
        
        addSubview(descriptionLabel)
        descriptionLabel.fillView(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 10, right: -20)
        )

        addSubview(sliderVC.view)
        sliderVC.view.fillView(
            top: descriptionLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
