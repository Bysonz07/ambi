//
//  ViewController.swift
//  ambi
//
//  Created by Mughie Arief Mughoni on 07/04/21.
//

import UIKit
import AVFoundation
<<<<<<< HEAD
=======

var musicPlayer : AVAudioPlayer!
>>>>>>> 2757fe246a2eb91f771191f91cb0d193835e4810

class ViewController: UIViewController {
    
    var musicPlayer : AVAudioPlayer!
    var brain = AmbiBrain()
    let text = "Wohooo!!!!"

<<<<<<< HEAD
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
    @IBOutlet weak var animatedLabels12: UILabel!
    @IBOutlet weak var animatedLabels13: UILabel!
    @IBOutlet weak var animatedLabels14: UILabel!
    

    
    @IBAction func soundButton(_ sender: UIButton) {
        soundButtonOutlet.isEnabled = false
        soundButtonOutlet.alpha = 0.5
        self.brain.playSound(musicName: "earworm", musicExtension: "mp3")
        self.brain.juglingText(text: text, listOfLabels: [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!,animatedLabels12!,animatedLabels13!,animatedLabels14!])
        soundButtonOutlet.isEnabled = true
        soundButtonOutlet.alpha = 1
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
=======
    func stopSound() {
            let url = Bundle.main.url(forResource: "bgmusik", withExtension: "mp3")
            musicPlayer = try! AVAudioPlayer(contentsOf: url!)
            musicPlayer.stop()
        }
    
    func playSound() {
    let url = Bundle.main.url(forResource: "bgmusik", withExtension: "mp3")
    musicPlayer = try! AVAudioPlayer(contentsOf: url!)
    musicPlayer.play()
    }
    
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
        
    }
>>>>>>> 2757fe246a2eb91f771191f91cb0d193835e4810

        
        let labelsList = [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!,animatedLabels12!,animatedLabels13!,animatedLabels14!]
        
        soundButtonOutlet.alpha = 0.5
        soundButtonOutlet.isEnabled = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            
            brain.playSound(musicName: "earworm", musicExtension: "mp3")
 
            brain.animateScale(apreciationStars)

            brain.animateImageSequence(image1: "penghapus.png", image2: "crayon.png", image3: "pencil", image4: "penggares", image5: "notes", uiImageView: gifAnimation1)
            
            brain.animateImageSequence(image1: "penghapus.png", image2: "crayon.png", image3: "pencil", image4: "penggares", image5: "notes", uiImageView: gifAnimation2)
            
            brain.clearJuglingText(text: text, listOfLabels: labelsList)
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            brain.juglingText(text: text, listOfLabels: labelsList)
            soundButtonOutlet.alpha = 1
            soundButtonOutlet.isEnabled = true
        }
        

<<<<<<< HEAD
    }
    
}
=======


>>>>>>> 2757fe246a2eb91f771191f91cb0d193835e4810
