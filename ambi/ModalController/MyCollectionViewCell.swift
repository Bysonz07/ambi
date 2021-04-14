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
    @IBOutlet weak var stampFill: UIImageView!
    public var onMoreButtonClick: (()-> ())?
    public var stateVis = false
    
    public func onStampClick(is state: Bool){
        if state == true{
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.blue.cgColor
            stampFill.isHidden = false
        } else {
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.clear.cgColor
            stampFill.isHidden = true
        }
        
    }
    var isCellSelected = false
    
//    fileprivate let bg: UIImageView = {
//       let iv = UIImageView()
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//                iv.layer.cornerRadius = 12
//        return iv
//    }()
    
    let strokeTextAttributes = [
      NSAttributedString.Key.strokeColor : UIColor.white,
      NSAttributedString.Key.foregroundColor : UIColor.blue,
      NSAttributedString.Key.strokeWidth : -6.0
      ]
      as [NSAttributedString.Key : Any]

//    labelOutLine.attributedText = NSMutableAttributedString(string: "Your outline text", attributes: strokeTextAttributes)
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stampFill.isHidden = false
        onStampClick(is: stateVis)
        }
    
    public func configure(with image: UIImage, item: String){ //dequeing
        imageView.image = image
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .white
        itemName.text = item
        itemName.attributedText = NSMutableAttributedString(string: item, attributes: strokeTextAttributes)
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
