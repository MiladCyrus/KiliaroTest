//
//  ImageCell.swift
//  Kiliaro
//
//  Created by Milad on 9/19/1400 AP.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
        //self.layer.cornerRadius = 4
    }
    
    func config(media: SharedMedia) {
        let imageUrl = media.thumbnailUrl + ThumbnailResizer().makeParameters(param: ImageResizer(w: Int(self.bounds.width), h: Int(self.bounds.height), m: .cropped))
        
        self.image.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, completed: nil)
        self.sizeLabel.text = Utilities.bytesToMegabytes(bytes: media.size)
    }
}
