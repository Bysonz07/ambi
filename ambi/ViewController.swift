//
//  ViewController.swift
//  ambi
//
//  Created by Mughie Arief Mughoni on 07/04/21.
//

import UIKit
import AVFoundation

var musicPlayer : AVAudioPlayer!

class ViewController: UIViewController {

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


}



