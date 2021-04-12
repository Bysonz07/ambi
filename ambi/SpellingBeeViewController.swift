//
//  SpellingBeeViewController.swift
//  ambi
//
//  Created by Difa N Pratama on 12/04/21.
//

import UIKit
import AVFoundation

class SpellingBeeViewController: UIViewController {

    
    var musicPlayer : AVAudioPlayer!
    var brain = AmbiBrain()
    let text = "Pencil"

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
//        self.brain.playSound(musicName: "earworm", musicExtension: "mp3")
        self.brain.juglingText(text: text, listOfLabels: [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!,animatedLabels12!,animatedLabels13!,animatedLabels14!])
        soundButtonOutlet.isEnabled = true
        soundButtonOutlet.alpha = 1
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let labelsList = [animatedLabels1!,animatedLabels2!,animatedLabels3!,animatedLabels4!,animatedLabels5!,animatedLabels6!,animatedLabels7!,animatedLabels8!,animatedLabels9!,animatedLabels10!,animatedLabels11!,animatedLabels12!,animatedLabels13!,animatedLabels14!]
        
        soundButtonOutlet.alpha = 0.5
        soundButtonOutlet.isEnabled = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            
//            brain.playSound(musicName: "earworm", musicExtension: "mp3")
 
            brain.animateScale(apreciationStars)

            brain.animateImageSequence(image1: "Pencil01.png", image2: "Pencil02.png", image3: "Pencil03.png", image4: "Pencil02.png", image5: "Pencil01.png", uiImageView: gifAnimation1)
            
            brain.animateImageSequence(image1: "Pencil01.png", image2: "Pencil02.png", image3: "Pencil03.png", image4: "Pencil02.png", image5: "Pencil01.png", uiImageView: gifAnimation2)
            
            brain.clearJuglingText(text: text, listOfLabels: labelsList)
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            brain.juglingText(text: text, listOfLabels: labelsList)
            soundButtonOutlet.alpha = 1
            soundButtonOutlet.isEnabled = true
        }
        
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
