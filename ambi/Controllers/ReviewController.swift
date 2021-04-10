//
//  ReviewController.swift
//  ambi
//
//  Created by Jehnsen Hirena Kane on 10/04/21.
//

import UIKit

class ReviewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var outletReviewCollection: UICollectionView!
    @IBOutlet weak var outletSkipToCongrats: UIButton!
    @IBOutlet weak var outletLabelTester2: UIButton!
    @IBOutlet weak var labeltester2: UILabel!
    var brain = AmbiBrain()
    let reuseIdentifier = "reviewCell" // also enter this string as the cell identifier in the storyboard
    var items = ["crayon", "notes", "pencil", "penggares", "penghapus"]
    var listOfImageString = ["crayon","notes","pencil", "penggares", "penghapus", "simbolSuara"]
    var listOfImages : [UIImage] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputImage()
    }
    
    
    @IBAction func bubarJalan(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func skipToCongrats(_ sender: UIButton) {
        congratsMuncul()
    }
    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listOfImageString.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        reviewCell.reviewImageView.image = self.listOfImages[indexPath.row] // The row value is the same as the index of the desired text within the array.
        reviewCell.backgroundColor = UIColor.clear // make cell more visible in our example project
        
        return reviewCell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        labeltester2.text = listOfImageString[indexPath.item]
        print(listOfImageString[indexPath.item])
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }

    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.clear
    }
    
    func inputImage() {
//        listOfImages = [(UIImage (named: listOfImageString[0]))]
        
            for i in 0...listOfImageString.count - 1 {
                listOfImages.append(UIImage (named: listOfImageString[i])!)
            }
    }
    
    
    
    @IBOutlet weak var outletImageCongrats: UIImageView!
    func congratsMuncul() {
        
        
        labeltester2.text = ""
        outletLabelTester2.alpha = 0
        outletSkipToCongrats.alpha = 0
        outletReviewCollection.alpha = 0
        outletImageCongrats.image = UIImage (named: "congrats.png")
        
        brain.animateScale(outletImageCongrats.layer)
    }
    
}
