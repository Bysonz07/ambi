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
    @IBOutlet weak var labeltester2: UILabel!
    var brain = AmbiBrain()
    let defaults = UserDefaults.standard
    let reuseIdentifier = "reviewCell" // also enter this string as the cell identifier in the storyboard
//    var items = ["crayon", "Book", "Highlighter", "Ruler", "Eraser"]
//    var listOfImageString = ["Crayon","Book","Pencil", "Ruler", "Eraser"]
    var itemList = itemOutlineNames
    var listOfImageString : [String] = []
    var imageChosen : [String] = []
    var listOfImages : [UIImage] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Card.stopRonde = 0
//        for i in Card.nameChosen{
//            Card.nameChosen.filter{$0 != i}
//        }
        listOfImageString = Card.nameChosen
        spellPlayer.stop()
        brain.animateOpacity(outletReviewCollection.layer)
        inputImage()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        outletReviewCollection.collectionViewLayout = layout
        outletReviewCollection.backgroundColor = .clear
        outletReviewCollection.delegate = self
        outletReviewCollection.dataSource = self
        
        //emitter
        subtleAnimate()
        
        //navigation setting
        self.navigationItem.title = "Stationery"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Baloo2-Medium", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
    }
    
    

    
    @IBAction func skipToCongrats(_ sender: UIButton) {
        brain.animateOpacityToZero(outletReviewCollection.layer)
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
        brain.playSound(musicName: "audio\(listOfImageString[indexPath.item])")
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
                listOfImages.append(UIImage (named: listOfImageString[i]+"Outline")!)
            }
    }
    
    
    
    @IBOutlet weak var outletImageCongrats: UIImageView!
    func congratsMuncul() {
        
        
        labeltester2.text = ""
        outletSkipToCongrats.alpha = 0
        outletReviewCollection.alpha = 0
        outletImageCongrats.image = UIImage (named: "congrats.png")
        
        brain.animateScale(outletImageCongrats.layer)
        
    }
    
    func subtleAnimate(){
        let emitter = Emitter.getEmitter(with: UIImage(imageLiteralResourceName: "triangle"), range: 45)
        emitter.emitterPosition = CGPoint(x: view.frame.width/4, y: view.frame.height)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.insertSublayer(emitter, at: 0)
        let emitter2 = Emitter.getEmitter(with: UIImage(imageLiteralResourceName: "circle"), range: 15)
        emitter2.emitterPosition = CGPoint(x: view.frame.width/4, y: view.frame.height)
        emitter2.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.insertSublayer(emitter2, at: 0)
    }
    
}

extension ReviewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
