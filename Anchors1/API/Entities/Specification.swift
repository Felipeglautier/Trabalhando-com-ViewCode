//
//  Specification.swift
//  Investimentos
//
//  Created by Lipe glautier on 03/04/21.
//

import Foundation

class Specification: Codable {
    
    var fundSuitabilityProfile: FundSuitabilityProfile
    
    enum CodingKeys: String, CodingKey {
        
        case fundSuitabilityProfile = "fund_suitability_profile"
    }
    
}
