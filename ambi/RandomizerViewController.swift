//
//  RandomizerViewController.swift
//  ambi
//
//  Created by Difa N Pratama on 12/04/21.
//

import UIKit

class RandomizerViewController: UIViewController {

    @IBOutlet weak var imageItems: UIImageView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var getItemName: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    var numbers:Int = 0
    var pathChosen = 0
    var brain = AmbiBrain()
    var stop = 0
    
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(randoming))

    var imageNames = itemNames
    var imageChosen : [String] = []
    var loopRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLink.add(to: .main, forMode: .default)
//        dpSound.add(to: .main, forMode: .default)
        //emitter
        subtleAnimate()

//        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: true) { timer in
//            print("Timer fired!")
//            runCount += 1
//            self.brain.playSound(musicName: "LotterSound")
//            if runCount == 15 || self.stop == 1{
//                self.brain.stopSound(musicName: "LotterSound")
//                timer.invalidate()
//            }
//        }
        
//        brain.playLotterySound(musicName: "LotterSound")
        // test
        
        //button
        goButton.isHidden = true
        goButton.layer.backgroundColor = UIColor.white.cgColor
        goButton.layer.cornerRadius = 12
        
        randomButton.layer.backgroundColor = UIColor.white.cgColor
        randomButton.layer.cornerRadius = 12
        
        //imageView
        imageItems.layer.backgroundColor = UIColor.systemTeal.cgColor
        imageItems.layer.borderWidth = 10
        imageItems.layer.cornerRadius = 70
        imageItems.layer.borderColor = UIColor.white.cgColor
        
        self.navigationItem.title = "Stationery"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Baloo2-Medium", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
    }

    
    @objc func randoming() -> Int{
//        print(pathChosen)
//        brain.playSound(musicName: "LotterSound")
//        if pathChosen == 1 {
//
//                numbers = Int (arc4random_uniform(UInt32(imageChosen.count)))
//                imageItems.image = UIImage(named: imageChosen[numbers])
//
//
//        }
//        else {
            numbers = Int (arc4random_uniform(12))
            imageItems.image = UIImage (named: imageNames[numbers])
//        }
//        displayLink.preferredFramesPerSecond = 1
        imageItems.layer.cornerRadius = 12
        return numbers
    }
    
    
    @IBAction func randomAction(_ sender: Any) {
        stop += 1
        brain.stopSound(musicName: "LotterSound")
        brain.playSound(musicName: "SelectedDingSound")
        
        displayLink.isPaused = true
//        dpSound.isPaused = true
        getItemName.text = "\(imageNames[numbers])"
        goButton.isHidden = false
        randomButton.isHidden = true
    }
    
    @IBAction func goAction(_ sender: Any) {
//        NotificationCenter.default.post(name: Notification.Name("randomV"), object: numbers)
        print("Pass Number : \(numbers)")
        performSegue(withIdentifier: "timer", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimerViewController {
            let destVc = segue.destination as? TimerViewController
            destVc?.indexImage = numbers
            destVc?.nextRound = stop
        }
//        if let destVc = segue.destination as? TimerViewController{
//            destVc.indexImage = numbers
//        }

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
