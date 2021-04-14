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
    
    
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(randoming))
    var imageNames = itemNames
    var imageChosen : [String] = []
    var loopRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLink.add(to: .main, forMode: .default)
        
        //emitter
        subtleAnimate()
        
        // test
        print(pathChosen)
        print("Image Chosen")
        print(imageChosen)
        print("\nImageNames")
        print(imageItems)
        //button
        goButton.isHidden = true
        goButton.layer.backgroundColor = UIColor.white.cgColor
        goButton.layer.cornerRadius = 12
        
        randomButton.layer.backgroundColor = UIColor.white.cgColor
        randomButton.layer.cornerRadius = 12
        
        self.navigationItem.title = "Stationery"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Baloo2-Medium", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
    }

    @objc func randoming() -> Int{
        
        if pathChosen == 1 {
            numbers = Int (arc4random_uniform(UInt32(imageChosen.count)))
            imageItems.image = UIImage(named: imageChosen[numbers])
        } else {
            numbers = Int (arc4random_uniform(12))
            imageItems.image = UIImage (named: imageNames[numbers])
        }
        displayLink.preferredFramesPerSecond = 1
        imageItems.layer.cornerRadius = 12
        return numbers
    }
    
    @IBAction func randomAction(_ sender: Any) {
        displayLink.isPaused = true
        getItemName.text = "\(imageNames[numbers])"
        goButton.isHidden = false
        randomButton.isHidden = true
    }
    
    @IBAction func goAction(_ sender: Any) {
//        NotificationCenter.default.post(name: Notification.Name("randomV"), object: numbers)
        performSegue(withIdentifier: "timer", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVc = segue.destination as! TimerViewController
        destVc.indexImage = numbers

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
