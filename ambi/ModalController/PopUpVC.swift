//
//  PopUpVC.swift
//  ambi_mc1
//
//  Created by Difa N Pratama on 05/04/21.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
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
        
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}

extension PopUpVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me at \(indexPath)")
//        let cell = collectionView.cellForItem(at: <#T##IndexPath#>) //This return UICollectionView Cell you need to type cast it
        // After you have the access to the cell, you can do whatever you want
        
    }
    
}

extension PopUpVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        let dataCard = ["Book","Brush","Crayon","Eraser","Glue","Highlighter","Paper","Pen","Pencil","Ruler","Sharpener","Tape"]
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
    
}
