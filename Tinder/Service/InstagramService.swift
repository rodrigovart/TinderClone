//
//  InstagramService.swift
//  Tinder
//
//  Created by Rodrigo Vart on 16/04/22.
//https://graph.instagram.com/me/media?fields=media_url,media_type&access_token=IGQVJWWkRuQVpORW5MZADY3eHBCQWdXQ1N4U2ltbzJjU3prMF8tQkJVSUpZAbDVrb3p5X2d4Ty1GS21NNXkyQzMxWVpVSXliLXo5eTVKX25YSEpWb2lkbkRFT2hneHZA6QlJ2azFRam03MDJfOXloV2FhNAZDZD

import Foundation
import Alamofire
import SwiftMessages

class InstagramService {
    
    static let shared = InstagramService()
    static let url = "https://graph.instagram.com/me/media?fields=media_url,media_type&access_token=IGQVJWWkRuQVpORW5MZADY3eHBCQWdXQ1N4U2ltbzJjU3prMF8tQkJVSUpZAbDVrb3p5X2d4Ty1GS21NNXkyQzMxWVpVSXliLXo5eTVKX25YSEpWb2lkbkRFT2hneHZA6QlJ2azFRam03MDJfOXloV2FhNAZDZD"
    
    func getInstagramMedia(completion: @escaping ([Instagram]) -> Void) {
        AF.request(InstagramService.url).responseDecodable(of: InstagramResults.self) { response in
            guard let instagramMedias = response.value?.data else {
                self.error()
                return
            }
            completion(instagramMedias)
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
