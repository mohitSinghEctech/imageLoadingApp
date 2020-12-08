//
//  CollectionView+Ex.swift
//  ImageLoadingApp
//
//  Created by Nikhil Batra on 09/12/20.
//

import UIKit

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(type: T.Type = T.self) {
        self.register(UINib(nibName: String(describing: T.self), bundle: .main), forCellWithReuseIdentifier: String(describing: T.self))
    }
}
