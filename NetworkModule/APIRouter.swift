//
//  APIRouter.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 8.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation
import Alamofire

public protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRouter {
    public func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(
            url: baseURL.appending(path),
            method: method,
            headers: authHeader)
        let encodedRequest = try encoding.encode(
            originalRequest,
            with: parameters)
        return encodedRequest
    }
}
