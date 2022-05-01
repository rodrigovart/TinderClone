//
//  UserService.swift
//  Tinder
//
//  Created by Rodrigo Vart on 28/02/22.
//

import Foundation
import Alamofire
import SwiftMessages

class UserService {
    
    static let shared =  UserService()
    
    func searchUsers(completion: @escaping ([User]) -> Void) {
        AF.request("https://randomuser.me/api?results=10&nat=br&inc=name,dob&gender=female&noinfo").responseDecodable(of: UserResults.self) { response in
//            guard let randomPersons = response.value?.results else {
//            self.error()
//            return
//        }
            completion(response.value!.results)
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
