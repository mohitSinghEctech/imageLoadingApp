//
//  Endpoints.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import Foundation

enum Endpoints {
    
    case getFlickerPhotoList(page: Int)
    
    var path: String {
        switch self {
        case .getFlickerPhotoList(let page):
            return AppConstants.BaseUrl + "?method=flickr.galleries.getPhotos&api_key=\(AppConstants.apiKey)&gallery_id=\(AppConstants.galleryId)&format=json&nojsoncallback=1&page=\(page)"
        }
    }
}
