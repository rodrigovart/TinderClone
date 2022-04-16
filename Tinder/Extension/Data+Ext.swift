//
//  Data+Ext.swift
//  Tinder
//
//  Created by Rodrigo Vart on 28/02/22.
//

import Foundation


extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
    
    func printFormatted(msg: String) -> Void{
        return print("\(msg) - \(self.prettyPrintedJSONString ?? "Data couldn't be printed")")
    }
}
