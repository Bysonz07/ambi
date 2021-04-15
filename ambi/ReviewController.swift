

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

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var labeltester2: UILabel!
    
    var brain = AmbiBrain()
    let reuseIdentifier = "reviewCell" // also enter this string as the cell identifier in the storyboard
    var items = ["crayon", "Book", "Pencil", "Ruler", "Eraser"]
    var listOfImageString = Card.nameChosen
    var listOfImages : [UIImage] = []
    var textArray : [String] = []
    var imageChosen : [String] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subtleAnimate()
        homeButton.isHidden = true
        outletReviewCollection.isHidden = false
        brain.animateOpacity(outletReviewCollection.layer)
        inputImage()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        outletReviewCollection.collectionViewLayout = layout
        outletReviewCollection.backgroundColor = .clear
        outletReviewCollection.delegate = self
        outletReviewCollection.dataSource = self
        outletReviewCollection.allowsMultipleSelection = true
    }
    

    @IBAction func skipToCongrats(_ sender: UIButton) {
        homeButton.isHidden = false
        outletSkipToCongrats.isHidden = true
        outletReviewCollection.isHidden = true
        congratsMuncul()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) { [self] in
            
//            brain.playSound(musicName: "earworm", musicExtension: "mp3")
//
            performSegue(withIdentifier: "homePage", sender: nil)
            
        }
//        performSegue(withIdentifier: "homePage", sender: nil)
    }
    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listOfImageString.count
    }
    
    
    //MARK: MASUKIN CELL
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
        brain.playSound(musicName: "audio" + String(labeltester2.text!).capitalized)
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.clear
        textArray.append(listOfImageString[indexPath.item])
        print(textArray)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        brain.playSound(musicName: "audio" + String(labeltester2.text!).capitalized)
        cell?.backgroundColor = UIColor.clear
        textArray = textArray.filter { $0 != listOfImageString[indexPath.item] }
        print(textArray)
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
        
        for i in Card.nameChosen {
            listOfImages.append(UIImage (named: i + "Outline")!)
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

