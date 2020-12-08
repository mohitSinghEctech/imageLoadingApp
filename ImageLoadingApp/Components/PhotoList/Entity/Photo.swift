//
//  Photo.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import Foundation

struct Photos: Codable {
    var page, pages, perpage, total: Int?
    var photos: [Photo]?
    
    enum CodingKeys: String, CodingKey {
        case page, pages, perpage, total
        case photos = "photo"
        
    }
}

struct Photo : Codable {
    
    var id, owner, secret, server: String?
    var farm: Int?
    var title: String?
    var imageUrl: String? {
        if let farm = farm, let server = server, let id = id, let secret = secret {
            return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        }
        return nil
    }
}
