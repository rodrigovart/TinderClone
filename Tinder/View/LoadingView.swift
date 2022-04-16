//
//  LoadingView.swift
//  Tinder
//
//  Created by Rodrigo Vart on 13/03/22.
//

import UIKit

class LoadingView: UIView {
    
    let loading: UIView = {
        let load = UIView()
        load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        load.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        load.layer.cornerRadius = 50
        load.layer.borderColor = UIColor.red.cgColor
        load.layer.borderWidth = 1
        
        return load
    }()
    
    let profileImage: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageProfile.layer.cornerRadius = 50
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 5
        imageProfile.clipsToBounds = true
        imageProfile.image = UIImage(named: "perfil")
        
        return imageProfile
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(loading)
        loading.center = center
        
        addSubview(profileImage)
        profileImage.center = center
        
        animateLoading()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateLoading() {
        UIView.animate(withDuration: 1.3, animations: {
            self.loading.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loading.layer.cornerRadius = 125
            self.loading.center = self.center
            self.loading.alpha = 0.3
        }) { (_) in
            self.loading.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.loading.layer.cornerRadius = 50
            self.loading.center = self.center
            self.loading.alpha = 1
            
            self.animateLoading()
        }
    }
}
