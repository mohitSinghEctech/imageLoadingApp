//
//  PhotoDetailPresenter.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

class PhotoDetailPresenter: PhotoDetailPresenterProtocol {
    var router: PhotoDetailRouterProtocol?
    var view: PhotoDetailViewProtocol?
    var photo: Photo?
    
    func viewDidLoad() {
        view?.showPhotoDetail(with: photo!)
    }
    
    func backButtonPressed(from view: UIViewController) {}
    
}
