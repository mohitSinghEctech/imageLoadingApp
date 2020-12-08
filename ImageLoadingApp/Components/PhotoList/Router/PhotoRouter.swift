//
//  PhotoRouter.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

class PhotoRouter: PhotoListRouterProtocol {
    
    // MARK:- Navigation to Detail Page
    
    func pushToPhotoDetail(with photo: Photo, from view: UIViewController) {
    }
    
    // MARK:- Photos Collection Page route
    
    static func createPhotoListModule(photoListRef: PhotoListView) {
        let presenter: PhotoListPresenterProtocol & PhotoListOutputInteractorProtocol = PhotosPresenter()
        
        photoListRef.presenter = presenter
        photoListRef.presenter?.router = PhotoRouter()
        photoListRef.presenter?.view = photoListRef
        photoListRef.presenter?.interactor = PhotosInteractor()
        photoListRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
