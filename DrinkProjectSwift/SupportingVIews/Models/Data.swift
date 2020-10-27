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
struct Token: Codable {
    var access_token: String
    var refresh_token: String
}

var token: Token?
