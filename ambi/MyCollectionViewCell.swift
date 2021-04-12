//
//  MyCollectionViewCell.swift
//  CollectionViewiOs
//
//  Created by Difa N Pratama on 08/04/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    //xib = xcode interface builder, nib = next interface builder (global name)
    @IBOutlet var imageView: UIImageView!
    
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        }
    
    public func configure(with image: UIImage){ //dequeing
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    

}
