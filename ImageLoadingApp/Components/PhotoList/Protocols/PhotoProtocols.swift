//
//  PhotoProtocols.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

// MARK:- PRESENTER -> VIEW

protocol PhotoListViewProtocol: class {
    func showPhotos(with photos: [Photo])
}

// MARK:- VIEW -> PRESENTER

protocol PhotoListPresenterProtocol {
    var interactor: PhotoListInputInteractorProtocol? {get set}
    var view: PhotoListViewProtocol? {get set}
    var router: PhotoListRouterProtocol? {get set}
    
    func viewDidLoad()
    func showPhotoSelection(with photo: Photo, from view: UIViewController)
}

//MARK:- PRESENTER -> INTERACTOR

protocol PhotoListInputInteractorProtocol {
    var presenter: PhotoListOutputInteractorProtocol? {get set}
    
    func getPhotoList()
}

// MARK:- INTERACTOR -> PRESENTER

protocol PhotoListOutputInteractorProtocol {
    func photoListDidFetch(photoList: [Photo])
}

// MARK:- PRESENTER -> ROUTER

protocol PhotoListRouterProtocol {
    func pushToPhotoDetail(with photo: Photo, from view: UIViewController)
    static func createPhotoListModule(photoListRef: PhotoListView)
}
