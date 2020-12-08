//
//  NetworkResponse.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import Foundation

struct NetworkResponse<T>:Decodable where T:Decodable {
    
    var data:T?
    var status:String?
    
    enum CodingKeys: String, CodingKey {
        case data = "photos"
        case status = "stat"
    }
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(T.self, forKey: .data)
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }
}
