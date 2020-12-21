//
//  Data.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/28.
//  Copyright © 2020 jiho. All rights reserved.
//

import Foundation

let baseUrl = "http://localhost:8080"
let clientID = "myApp"
let clientSecret = "pass"


var token : Token? = loadUserDefaults("token")
struct Token: Codable {
    var access_token: String
    var refresh_token: String
}

func loadUserDefaults<T: Decodable>(_ forKey: String) -> T? {
    let decoder = JSONDecoder()
    guard let token = UserDefaults.standard.data(forKey: "token") else {
        return nil
    }
    guard let decode = try? decoder.decode(T.self, from: token) else {
        return nil
    }
    return decode
    
}
