//
//  PhotoCollectionViewCell.swift
//  ImageLoadingApp
//
//  Created by Mohit Kumar Singh on 08/12/20.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    // MARK:- Variables and Constants
    
    var pImage = ""
    var textLabel = ""
    
    // MARK:- Awake from Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK:- Helper Functions
    
    func setData() {
        photoImage.sd_setImage(with: URL(string: pImage))
        photoLabel.text = textLabel
    }

}
