//
//  UIView+Ext.swift
//  Tinder
//
//  Created by Rodrigo Vart on 27/02/22.
//

import UIKit
import SwiftMessages

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
    
    func error() {
        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: .centeredView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.error)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        view.configureContent(title: "Erro", body: "", iconText: "👻")
        
        // Increase the external margin around the card. In general, the effect of this setting
        // depends on how the given layout is constrained to the layout margins.
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        // Reduce the corner radius (applicable to layouts featuring rounded corners).
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.button?.isHidden = true
        
        // Customize config using the default as a base.
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 2)
        
        // Show the message.
        SwiftMessages.show(config: config, view: view)
    }
}
