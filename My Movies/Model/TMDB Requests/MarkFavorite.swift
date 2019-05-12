//
//  HomeViewController.swift
//  My Movies
//
//  Created by karim metawea on 5/11/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

struct MarkFavorite: Codable {
    let mediaType: String
    let mediaId: Int
    let favorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case favorite = "favorite"
    }
    
}
