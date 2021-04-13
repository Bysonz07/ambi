//
//  ViewController.swift
//  ambi
//
//  Created by Mughie Arief Mughoni on 07/04/21.
//

import UIKit
import AVFoundation

var musicPlayer : AVAudioPlayer!
let url = Bundle.main.url(forResource: "bgmusik", withExtension: "mp3")

class ViewController: UIViewController {
    
    @IBOutlet var homeCollectionView: UICollectionView!
    
    
    
    func stopSound() {
            
            musicPlayer = try! AVAudioPlayer(contentsOf: url!)
            musicPlayer.stop()
        }
    
    func playSound() {
        
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        musicPlayer.play()
    }
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
//        let keadaanMusik = defaults.bool(forKey: "musicState")
        if defaults.value(forKey: "musicState") != nil{
                   let switchON: Bool = defaults.value(forKey: "musicState")  as! Bool
                   if switchON == true{
                    playSound()
                   }
                   else if switchON == false{
                    stopSound()
                   }
               }

        self.navigationItem.titleView = UIImageView ( image: UIImage(named: "logoambi"))
        
        //Collection View
        homeCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 500, height: 500)
        homeCollectionView.collectionViewLayout = layout
        homeCollectionView.backgroundColor = .clear
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    
        //emitter bg
        subtleAnimate()
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


extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        if indexPath.item == 1 {
//            performSegue(withIdentifier: "Modality", sender: nil)
//        }
//        else if indexPath.item == 2{
//            performSegue(withIdentifier: "Modality", sender: nil)
//        }
//        else if indexPath.item == 3{
//            performSegue(withIdentifier: "Modality", sender: nil)
//        }
        performSegue(withIdentifier: "randomizer", sender: nil)
        
    }
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
       let dataCard = ["Colors","Stationery","Shapes"]
        for data in indexPath{
            cell.configure(with: UIImage(named: dataCard[data])!,and: dataCard[data])
        }
        cell.onMoreButtonClick = {
            self.performSegue(withIdentifier: "Modality", sender: nil)
        }
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{ //let specify what is the margin and padding between cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 500, height: 500)
    }
    
}

