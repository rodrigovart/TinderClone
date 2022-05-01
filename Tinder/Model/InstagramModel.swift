//
//  InstagramModel.swift
//  Tinder
//
//  Created by Rodrigo Vart on 30/04/22.
//

import Foundation

struct InstagramResults: Decodable  {
    var data: [Instagram]
}

struct Instagram: Decodable  {
    var media_url: String
    var media_type: String
    var id: String
}
