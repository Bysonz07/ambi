//
//  SpellingBeeViewController.swift
//  ambi
//
//  Created by Difa N Pratama on 12/04/21.
//

import UIKit
import AVFoundation

var spellPlayer : AVAudioPlayer!

class SpellingBeeViewController: UIViewController {

    let defaults = UserDefaults.standard
    var spellPlayer : AVAudioPlayer!
    var brain = AmbiBrain()
    var indexImages = 0
    var nextRound = 0
    let text = "Pencil"
    var imageChosen : [String] = []
    var stopRound = 0
    

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var soundButtonOutlet: UIButton!
    @IBOutlet weak var gifAnimation1: UIImageView!
    @IBOutlet weak var gifAnimation2: UIImageView!
    @IBOutlet weak var apreciationStars: CALayer!
    @IBOutlet weak var animatedLabels1: UILabel!
    @IBOutlet weak var animatedLabels2: UILabel!
    @IBOutlet weak var animatedLabels3: UILabel!
    @IBOutlet weak var animatedLabels4: UILabel!
    @IBOutlet weak var animatedLabels5: UILabel!
    @IBOutlet weak var animatedLabels6: UILabel!
    @IBOutlet weak var animatedLabels7: UILabel!
    @IBOutlet weak var animatedLabels8: UILabel!
    @IBOutlet weak var animatedLabels9: UILabel!
    @IBOutlet weak var animatedLabels10: UILabel!
    @IBOutlet weak var animatedLabels11: UILabel!
//    @IBOutlet weak var animatedLabels12: UILabel!
//    @IBOutlet weak var animatedLabels13: UILabel!
//    @IBOutlet weak var animatedLabels14: UILabel!
    

    
    @IBAction func soundButton(_ sender: UIButton) {
        soundButtonOutlet.isEnabled = false
        soundButtonOutlet.alpha = 0.5
//        self.brain.playSound(musicName: "earworm", musicExtension: "mp3")
        self.brain.juglingText(text: text, listOfLabels: [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!])
        soundButtonOutlet.isEnabled = true
        soundButtonOutlet.alpha = 1
    }
    
    var stoper = Card.stopRonde
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("sended"), object: nil)
               
        Card.stopRonde += 1
        //get passing data
        if stoper >= defaults.value(forKey: "BanyakItem") as! Int{
            skipButton.isHidden = false
            nextButton.isHidden = true
        } else {
            skipButton.isHidden = true
            nextButton.isHidden = false
        }
        
        let text = itemNames[indexImages]
        print("text: \(text)")
        
        self.navigationItem.title = "Stationery"
        let labelsList = [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!]
        
        soundButtonOutlet.alpha = 0.5
        soundButtonOutlet.isEnabled = false
        
        nextButton.alpha = 0.5
        nextButton.isEnabled = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            
//            brain.playSound(musicName: "earworm", musicExtension: "mp3")
// 
            brain.animateScale(apreciationStars)

            brain.animateImageSequence(image1: "\(itemNames[indexImages])01.png", image2: "\(itemNames[indexImages])02.png", image3: "\(itemNames[indexImages])03.png", image4: "\(itemNames[indexImages])02.png", image5: "\(itemNames[indexImages])01.png", uiImageView: gifAnimation1)
            
            brain.animateImageSequence(image1: "\(itemNames[indexImages])01.png", image2: "\(itemNames[indexImages])02.png", image3: "\(itemNames[indexImages])03.png", image4: "\(itemNames[indexImages])02.png", image5: "\(itemNames[indexImages])01.png", uiImageView: gifAnimation2)
            
            brain.clearJuglingText(text: text, listOfLabels: labelsList)
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            let defaults = UserDefaults.standard
            if defaults.value(forKey: "spellState") != nil{
                       let switchON: Bool = defaults.value(forKey: "spellState")  as! Bool
                       if switchON == true{
                        brain.juglingText(text: text, listOfLabels: labelsList)
                        soundButtonOutlet.alpha = 1
                        soundButtonOutlet.isEnabled = true
                        nextButton.alpha = 1
                        nextButton.isEnabled = true
                       }
                       else if switchON == false{
                        
                       }
                   }
//            brain.juglingText(text: text, listOfLabels: labelsList)
//            soundButtonOutlet.alpha = 1
//            soundButtonOutlet.isEnabled = true
        }
        
        //emitter bg
        subtleAnimate()
        
        
        //navigation setting
        self.navigationItem.title = "Stationery"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Baloo2-Medium", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let text = notification.object as! Int?
//        print(text)
        stopRound += text!
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "randomizer", sender: nil)
    }
   
    @IBAction func skipAction(_ sender: UIButton) {
        performSegue(withIdentifier: "reviewer", sender: nil)
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVc = segue.destination as? RandomizerViewController{
            destVc.stop = stopRound + 1
            destVc.imageNames = imageChosen.filter{$0 == text}
        }
        if let destVc = segue.destination as? ReviewController{
            destVc.imageChosen = imageChosen
        }
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
