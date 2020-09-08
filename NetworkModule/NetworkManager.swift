//
//  NetworkManager.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 12.08.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import Alamofire


public enum Error: Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public protocol NetworkManagerProtocol {
    func fetchDTOs<T>(_ router:NetworkAPI,type: T.Type, completion: @escaping(Result<T>) -> Void) where T:Codable
}


public class NetworkManager:NetworkManagerProtocol {
    
    public init() {}
    
    public func fetchDTOs<T>(_ router:NetworkAPI,type: T.Type = T.self, completion: @escaping (Result<T>) -> Void) where T:Codable{
        AF.request(router).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(type, from: data)
                    completion(.success(response))
                }catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
