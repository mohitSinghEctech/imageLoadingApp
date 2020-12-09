//
//  PhotoDetailRouter.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

class PhotoDetailRouter: PhotoDetailRouterProtocol {
    
    class func createPhotoDetailModule(with photoDetailRef: PhotoDetailView, and photo: Photo) {
        let presenter = PhotoDetailPresenter()
        presenter.photo = photo
        photoDetailRef.presenter = presenter
        photoDetailRef.presenter?.view = photoDetailRef
        photoDetailRef.presenter?.router = PhotoDetailRouter()
    }
    
    func goBackToPhotosView(from view: UIViewController) {}
}
