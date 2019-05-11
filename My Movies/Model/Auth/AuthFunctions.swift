//
//  AuthFunctions.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import Foundation
class AuthFunctions {
    
    static func getToken(completion: @escaping (Bool,Error?) -> ()){
        
        let session = URLSession.shared.dataTask(with: Endpoints.requestToken.url) { (data, response, error) in
            
            
            guard let data = data else {
                completion(false,error)
                return}
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(RequestTokenResponse.self, from: data)
                Auth.requestToken = responseObject.requestToken
                
                completion(true,nil)
            } catch{
                fatalError()
            }
            
            
        }
        session.resume()
        
    }
    
    static func logIn(logIn:LogInRequest, completion: @escaping (Bool,Error?) -> ()){
        var request = URLRequest(url: Endpoints.logIn.url)
        let headers = ["content-type": "application/json"]
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        do {
            let body = try encoder.encode(logIn)
            request.httpBody = body
        }catch {
            fatalError()
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(false,error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(RequestTokenResponse.self, from: data)
                Auth.requestToken = responseObject.requestToken
                completion(true,nil)
                
            } catch {
                completion(false,error)
            }
            
        }
        task.resume()
        
    }
    
    static func getSessionId(completion: @escaping (Bool,Error?) -> ()){
        var request = URLRequest(url: Endpoints.sessionId.url)
        let headers = ["content-type": "application/json"]
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        do {
            
            let body = SessionIdRequest(requestToken:Auth.requestToken)
            request.httpBody = try encoder.encode(body)
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(false,error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(SessionIdResponse.self, from: data)
                print(responseObject)
                Auth.sessionId = responseObject.sessionId
                completion(true,nil)
                
            } catch {
                completion(false,error)
            }
            
        }
        task.resume()
        
    }
    
    
   
    
    
    
}
