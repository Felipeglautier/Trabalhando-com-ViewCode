//
//  FundSuitabilityProfile.swift
//  Investimentos
//
//  Created by Lipe glautier on 03/04/21.
//

import Foundation

class FundSuitabilityProfile: Codable {
    
    var name: String
    
    enum CodingKeys: String, CodingKey {
     
        case name
    }
}
