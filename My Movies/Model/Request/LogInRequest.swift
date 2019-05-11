//
//  LogInRequest.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation
struct LogInRequest:Codable {
    
    let userName:String
    let password:String
    let requestToken:String
    
    enum CodingKeys:String,CodingKey {
        case userName = "username"
        case password
        case requestToken = "request_token"
    }
}
