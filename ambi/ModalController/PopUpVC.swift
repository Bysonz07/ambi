//
//  PopUpVC.swift
//  ambi_mc1
//
//  Created by Difa N Pratama on 05/04/21.
//

import UIKit

class PopUpVC: UIViewController, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet weak var buttonRandom: UIButton!
    @IBOutlet weak var buttonOke: UIButton!
    
    let defaults = UserDefaults.standard
    var cardChosen = 0
    var dataCard = itemNames
    
    var textArray : [String] = []
    private let sectionInsets = UIEdgeInsets(
      top: 50.0,
      left: 20.0,
      bottom: 20.0,
      right: 20.0)
    
    private var selectedItems: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //register nib
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
      
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 300)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        //button customize
        buttonOke.layer.cornerRadius = 20
        buttonRandom.layer.cornerRadius = 20
        buttonRandom.layer.borderColor = UIColor.white.cgColor
        buttonRandom.layer.borderWidth = 5
    }
    
    //IBAction
    @IBAction func buttonRandomAction(_ sender: Any) {
        cardChosen = 0
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "randomizerVc") as! RandomizerViewController
//
//        vc.modalPresentationStyle = .fullScreen
//
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func buttonOkeAction(_ sender: Any) {
        cardChosen = 1
//        performSegue(withIdentifier: "defRandomizer", sender: nil)
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVc = segue.destination as! RandomizerViewController
        destVc.imageChosen = textArray
        destVc.pathChosen = cardChosen
    }
    
    //select collection view
    var totalItem = 0
    var tItem_Now = 0
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
//        labeltester2.text = listOfImageString[indexPath.item]
        print(dataCard[indexPath.item])
        
        totalItem = defaults.value(forKey: "LamaWaktu") as! Int
        if tItem_Now < totalItem {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.red.cgColor
            cell?.layer.borderWidth = 5
            cell?.layer.cornerRadius = 12
            textArray.append(dataCard[indexPath.item])
            print(textArray)
            
        } else {
            tItem_Now = 0
        }
        tItem_Now += 1
        print("Total item = \(tItem_Now)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        totalItem = defaults.value(forKey: "LamaWaktu") as! Int
        if tItem_Now < totalItem {
            print("deSelected cell #\(indexPath.item)!")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.clear.cgColor
            textArray = textArray.filter { $0 != dataCard[indexPath.item] }
            print(textArray)
            
        } else if tItem_Now < 0 {
            tItem_Now = 0
        }
        tItem_Now -= 1
        print("Total item = \(tItem_Now)")
    }

}

//Mark: - Extension
extension PopUpVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        
         for data in indexPath{
            cell.configure(with: UIImage(named: dataCard[data])!, item: dataCard[data])
             
         }
        return cell
    }
    
}

extension PopUpVC: UICollectionViewDelegateFlowLayout{ //let specify what is the margin and padding between cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAt section: Int
//      ) -> UIEdgeInsets {
//        return sectionInsets
//      }
      
      // 4
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return sectionInsets.bottom
      }
    
}
