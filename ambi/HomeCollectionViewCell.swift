//
//  MyCollectionViewCell.swift
//  CollectionViewiOs
//
//  Created by Difa N Pratama on 08/04/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    //xib = xcode interface builder, nib = next interface builder (global name)
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var segueButton: UIButton!
    
    @IBAction func segueButtonAction(_ sender: Any) {
        
    }
    
    var seg: String = ""
    static let identifier = "HomeCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        }
    
    public func configure(with image: UIImage, and text: String){ //dequeing
        imageView.image = image
        nameLabel.text = text
        
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeCollectionViewCell", bundle: nil)
    }
    
    

}
