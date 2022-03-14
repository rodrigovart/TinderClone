//
//  UserService.swift
//  Tinder
//
//  Created by G4 tech on 28/02/22.
//

import Foundation
import Alamofire

class UserService {
    
    static let shared =  UserService()
    
    func searchUsers(completion: @escaping ([User]) -> Void) {
        AF.request("https://randomuser.me/api?results=20&nat=br&inc=name,dob&gender=female&noinfo").responseDecodable(of: UserResults.self) { response in
            guard let randomPersons = response.value?.results else { return }
            completion(randomPersons)
        }
    }
}
