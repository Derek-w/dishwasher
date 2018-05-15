//
//  Dishwasher.swift
//  Dishwasher
//
//  Created by Admin on 5/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Dishwasher: Decodable {
    
    let title: String
    let price: [String: String]
    let image: String
    
}

struct ApiResponse: Decodable {
    
    let products: [Dishwasher]
    
}

