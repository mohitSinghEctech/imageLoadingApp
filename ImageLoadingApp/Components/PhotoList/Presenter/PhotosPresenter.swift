//
//  PhotosPresenter.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

class PhotosPresenter:PhotoListPresenterProtocol {
    
    // MARK:- Variables and Constants
    
    var interactor: PhotoListInputInteractorProtocol?
    var view: PhotoListViewProtocol?
    var router: PhotoListRouterProtocol?
    
    // MARK:- Helper Functions
    
    func showPhotoSelection(with photo: Photo, from view: UIViewController) {
        router?.pushToPhotoDetail(with: photo, from: view)
    }
    
    func viewDidLoad() {
        self.loadPhotoList()
    }

    func loadPhotoList() {
        interactor?.getPhotoList()
    }
}

// MARK:- Interactor Protocol

extension PhotosPresenter: PhotoListOutputInteractorProtocol {
    func showError(message: String?) {
        view?.showError(message: message)
    }
    
    func photoListDidFetch(photoList: [Photo]) {
        view?.showPhotos(with: photoList)
    }
}
