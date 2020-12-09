//
//  PhotosInteractor.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import Foundation

class PhotosInteractor: PhotoListInputInteractorProtocol {
    
    var presenter: PhotoListOutputInteractorProtocol?
    var total = 0
    
    func getPhotoList() {
        
        Network.session.requesData(path: Endpoints.getFlickerPhotoList(page: 1).path, type: Photos.self) { (result) in
            switch result {
            case .success(let photos):
                self.presenter?.photoListDidFetch(photoList: photos?.photos ?? [])
                break
            case .failure(let error):
                self.presenter?.showError(message: error.localizedDescription)
                break
            }
        }
    }
    
    func calculateSum(a: Int, b: Int) {
        total = a + b
    }
}
