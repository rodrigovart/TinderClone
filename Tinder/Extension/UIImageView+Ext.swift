//
//  UIImageView+Ext.swift
//  Tinder
//
//  Created by Rodrigo Vart on 01/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    static func createUIImageView(_ named: String? = nil, _ sizeView: CGSize = .zero, isIcon: Bool? = false) -> UIImageView {
        let image = UIImageView()
        if let named = named {
            image.image = UIImage(named: named)
        }
        image.size(size: sizeView)
        if let isIcon = isIcon, isIcon {
            image.alpha = 0
        }
        image.clipsToBounds = true
        return image
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
