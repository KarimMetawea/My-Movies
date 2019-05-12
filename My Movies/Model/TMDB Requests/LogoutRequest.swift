//
//  HomeViewController.swift
//  My Movies
//
//  Created by karim metawea on 5/11/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

struct LogoutRequest: Codable {
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
    }
}
