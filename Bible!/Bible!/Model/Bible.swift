//
//  Bible.swift
//  Bible!
//
//  Created by Julian A. Fordyce on 2/25/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct Bible: Codable {
    let results: [Result]
}

struct Result: Codable {
    let reference: String
    let content: String
}
