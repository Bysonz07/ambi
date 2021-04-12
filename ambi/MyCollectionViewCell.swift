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
    
//    fileprivate let bg: UIImageView = {
//       let iv = UIImageView()
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//                iv.layer.cornerRadius = 12
//        return iv
//    }()
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        }
    
    public func configure(with image: UIImage){ //dequeing
        imageView.image = image
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .white
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    

}
