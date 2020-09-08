//
//  Movie.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 8.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import Foundation

public struct Movie:Codable {
    let name : String
    let url : String
    let desc : String
    let imdb : String
}
