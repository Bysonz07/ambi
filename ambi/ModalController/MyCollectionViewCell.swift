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
    @IBOutlet weak var itemName: UILabel!
    
    var isCellSelected = false
    
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
    
    public func configure(with image: UIImage, item: String){ //dequeing
        imageView.image = image
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .white
        itemName.text = item
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func toggleCheckButton(){
        isCellSelected.toggle()
        
        if isCellSelected{
            
            //update the interface for on state
        }else{
            //update the interface for off state
        }
    }
    
    

}
