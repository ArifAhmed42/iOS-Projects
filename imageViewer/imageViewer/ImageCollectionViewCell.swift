//
//  ImageCollectionViewCell.swift
//  imageViewer
//
//  Created by SM Arif Ahmed on 5/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    var imageNumber: Int!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
