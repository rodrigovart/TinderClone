//
//  UILabel+Ext.swift
//  Tinder
//
//  Created by Rodrigo Vart on 28/02/22.
//

import Foundation
import UIKit

extension UILabel {
    static func textLabel(size: CGFloat, textColor: UIColor = .white, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
    }
    
    static func textBoldLabel(size: CGFloat, textColor: UIColor = .white, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
    }
}
