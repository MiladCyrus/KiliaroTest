//
//  ImageCell.swift
//  Kiliaro
//
//  Created by Milad on 9/19/1400 AP.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
}
