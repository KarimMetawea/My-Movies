//
//  SessionIdResponse.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

struct SessionIdResponse:Codable {

   let  success:Bool
   let sessionId:String
    
    enum CodingKeys:String,CodingKey {
        case success
        case sessionId = "session_id"
    }
    
}
