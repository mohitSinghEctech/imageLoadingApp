//
//  PhotoDetailProtocols.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

// MARK:- VIEW -> PRESENTER

protocol PhotoDetailPresenterProtocol: class {
    var router: PhotoDetailRouterProtocol? {get set}
    var view: PhotoDetailViewProtocol? {get set}
    
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

// MARK:- PRESENTER -> VIEW

protocol PhotoDetailViewProtocol: class {
    func showPhotoDetail(with fruit: Photo)
}

// MARK:- PRESENTER -> ROUTER

protocol PhotoDetailRouterProtocol: class {
    func goBackToPhotosView(from view: UIViewController)
}
