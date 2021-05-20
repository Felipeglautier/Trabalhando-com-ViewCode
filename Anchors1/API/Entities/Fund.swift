//
//  Fund.swift
//  Investimentos
//
//  Created by Lipe glautier on 03/04/21.
//

import Foundation

class Fund: Codable {
    
    var simpleName: String
    var operability: Operability
    var specification: Specification
    
    enum CodingKeys: String, CodingKey {
        case simpleName = "simple_name"
        case operability
        case specification
       }
 }
    
