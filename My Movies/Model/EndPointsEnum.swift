//
//  EndPointsEnum.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation

enum Endpoints {
    
    static let apiKey = "6f7ed80e3466761ed04f63d969602ce8"
    static let base = "https://api.themoviedb.org/3"
    static let apiKeyParam = "?api_key=\(Endpoints.apiKey)"
    
    case getWatchlist
    case requestToken
    case logIn
    case sessionId
    case popularMovies
    case getImage(String?)
    
    var stringValue: String {
        switch self {
        case .getWatchlist: return Endpoints.base + "/account/\(Auth.accountId)/watchlist/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
        case .requestToken:
            return Endpoints.base + "/authentication/token/new\(Endpoints.apiKeyParam)"
            
        case .logIn:
            return Endpoints.base + "/authentication/token/validate_with_login\(Endpoints.apiKeyParam)"
            
        case .sessionId:
            return Endpoints.base + "/authentication/session/new\(Endpoints.apiKeyParam)"
        case .popularMovies:
            return Endpoints.base + "/movie/popular\(Endpoints.apiKeyParam)"+"&language=en-US&page=1"
        case .getImage(let imagepath):
            return "https://image.tmdb.org/t/p/w500/\(imagepath ?? "kqjL17yufvn9OVLyXYpvtyrFfak.jpg")"
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}
