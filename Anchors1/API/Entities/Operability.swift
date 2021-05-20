//
//  Operability.swift
//  Investimentos
//
//  Created by Lipe glautier on 03/04/21.
//

import Foundation

class Operability: Codable {
    
    var minimumInitialApplicationAmount: String
    
    enum CodingKeys: String, CodingKey {
        
        case minimumInitialApplicationAmount = "minimum_initial_application_amount"
    }
}
