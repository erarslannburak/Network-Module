//
//  NetworkAPI+HTTP.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 8.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Alamofire

extension NetworkAPI:APIRouter {
    
    public var baseURL: String {
        return "https://devfestkutahya19.firebaseio.com/"
    }
    
    public var path: String {
        switch self {
        case .homepage:
            return "Movies.json"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .homepage: return .get
        }
    }
    
    public var parameters: Parameters {
        switch self {
        case .homepage:
            return [:]
        }
    }
    
    public var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var authHeader: HTTPHeaders? {
        switch self {
        default:
            return [:]
        }
    }
}
