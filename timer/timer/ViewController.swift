//
//  ViewController.swift
//  timer
//
//  Created by Olivia Dwi  Susanti on 08/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var repeatButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var gifAnimation1: UIImageView!
    
    @IBOutlet weak var gifAnimation2: UIImageView!
    
    var timerCountdown = Timer()
    var counter = 0
    var resumeTapped = false
    var itemName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animate gif
        animateImageSequence(image1: "PencilOutline.png", uiImageView: gifAnimation1)
        animateImageSequence(image1: "PencilOutline.png", uiImageView: gifAnimation2)
        
        // timer
        itemName = "PENCIL"
        counter = 10
        countdownLabel.text = "\(counter)"
//        countdownLabel.font = UIFont(name: "Baloo2-Regular.ttf ", size: 100.0)
        
        countdownTimer()
    }
    
    @objc func runCountdown() {
        countdownLabel.text = "\(counter)"
        counter -= 1
        
        if counter == 0 {
            timerCountdown.invalidate()
            countdownLabel.text = "Times Up!"
            itemLabel.text = ""
//            countdownLabel.font = UIFont(name: "Baloo2-Regular.ttf ", size: 100)
        }
    }
    
    func countdownTimer() {
        timerCountdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timerCountdown.invalidate()
            self.resumeTapped = true
//            pauseButton.setImage(UIImage(named: "pause.circle"), for: .normal)
        } else {
            countdownTimer()
            self.resumeTapped = false
//            pauseButton.setImage(UIImage(named: "play.circle"), for: .normal)
        }
        
    }

    @IBAction func repeatTapped(_ sender: Any) {
        timerCountdown.invalidate()
        counter = 10
        countdownLabel.text = String(counter)
        itemLabel.text = String(itemName)
        countdownTimer()
    }
    
}

