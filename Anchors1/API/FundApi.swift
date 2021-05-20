
import Foundation
import Alamofire
 
class FundAPI  {
    static let shared = FundAPI()
        
    func getFund(completion: @escaping ([Fund]?) -> Void) {
        
        let endpoint: String = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"

        Alamofire.request(endpoint, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
    
                switch response.result {
                
                case .success:
                    
                    var fund: [Fund]?
                    if let data = response.data {
                        fund = try! JSONDecoder().decode([Fund].self, from: data)
                    }
                    
                    completion(fund)
                case .failure:
                    completion(nil)
            }
        }
    }
}
