//
//  MovieFunctions.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class MoviesFunctions {
    
    static func getPopularMovies(completion:@escaping (Bool,Error?)->()){
        
        let decoder = JSONDecoder()
        
        let session = URLSession.shared.dataTask(with: Endpoints.popularMovies.url) { (data, response, error) in
            guard let data = data else  {
                completion(false,error)
                return
            }
            do {
                let responseObject = try decoder.decode(MoviesResult.self, from: data)
                print(responseObject)
                MoviesData.popularMovies = responseObject.results
                completion(true,nil)
            } catch {
                completion(false,error)
            }
        }
           session.resume()
        }
        
    }
    



