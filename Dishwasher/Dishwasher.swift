//
//  Dishwasher.swift
//  Dishwasher
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Dishwaser: Decodable {
    
    let title: String
    let tilte: [String: String]
    
}

struct ApiResponse: Decodable {
    
    let products: [Dishwaser]
    
}

