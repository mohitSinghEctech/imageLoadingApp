//
//  PhotoListView.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit
import SDWebImage

class PhotoListView: UIViewController  {
    
    // MARK:- IBOutlets
    
    @IBOutlet var photoCollectioView: UICollectionView!
    
    // MARK:-  Variables and Constants
    
    var presenter: PhotoListPresenterProtocol?
    var photos = [Photo]()
    
    // MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoRouter.createPhotoListModule(photoListRef: self)
        presenter?.viewDidLoad()
        photoCollectioView.delegate = self
        photoCollectioView.dataSource = self
        registerNibs()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.photoCollectioView.reloadData()
    }
    
    // MARK:- Helper Functions
    
    func registerNibs() {
        photoCollectioView.registerNib(type: PhotoCollectionViewCell.self)
    }
}

extension PhotoListView: PhotoListViewProtocol {
    func showError(message: String?) {
        self.addAlert(message: message ?? "Unable to Fetch Photos")
    }
    
    
    func showPhotos(with photos: [Photo]) {
        self.photos = photos
        DispatchQueue.main.async {
            self.photoCollectioView.reloadData()
        }
    }
}

// MARK:- Extension: Collection View Delegate and Data Source

extension PhotoListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()
        }
        cell.pImage = photos[indexPath.row].imageUrl ?? ""
        cell.textLabel = photos[indexPath.row].title ?? ""
        cell.setData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showPhotoSelection(with: photos[indexPath.row], from: self)
    }
}

// MARK:- Collection View FlowLayout Delegate

extension PhotoListView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
}
