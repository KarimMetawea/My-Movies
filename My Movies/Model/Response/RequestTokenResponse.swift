//
//  RequestTokenResponse.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

struct RequestTokenResponse:Codable  {
    
    let success:Bool
    let expiresAt:String
    let requestToken:String
    
    enum CodingKeys:String,CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
