//
//  SessionIdRequest.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

struct SessionIdRequest:Codable {
    let requestToken : String
    
    enum CodingKeys: String , CodingKey {
        case requestToken = "request_token"
    }
}
