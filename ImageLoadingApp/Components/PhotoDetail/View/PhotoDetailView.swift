//
//  PhotoDetailView.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit
import SDWebImage

class PhotoDetailView: UIViewController, PhotoDetailViewProtocol {
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var detailImage: UIImageView!
    
    // MARK:- Variables and Constants
    
    var presenter: PhotoDetailPresenterProtocol?
    
    // MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK:- Helper Functions
    
    func showPhotoDetail(with photo: Photo) {
        detailImage.sd_setImage(with: URL(string: photo.imageUrl ?? ""))
    }
}
