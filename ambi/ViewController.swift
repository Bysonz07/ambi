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

    func stopSound() {
            
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



