//
//  UIView+Ext.swift
//  Tinder
//
//  Created by G4 tech on 27/02/22.
//

import UIKit

extension UIView {
    
    func fillView(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
    }
    
    func size(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        fillView(
            top: superview?.topAnchor,
            leading: superview?.leadingAnchor,
            trailing: superview?.trailingAnchor,
            bottom: superview?.bottomAnchor,
            padding: padding
        )
    }
    
    func centralizeSuperView(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superViewCenterY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superViewCenterY).isActive = true
        }
        
        if let superViewCenterX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterX).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
