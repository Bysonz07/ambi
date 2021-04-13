//
//  RandomizerViewController.swift
//  ambi
//
//  Created by Difa N Pratama on 12/04/21.
//

import UIKit

class RandomizerViewController: UIViewController {

    @IBOutlet var imageRandom: UIImageView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var randomGetLabel: UILabel!
    
    var brain = AmbiBrain()
    var isCellSelected = false
    
    let imageNames = ["Book", "Brush", "Crayon", "Eraser", "Glue", "Highlighter", "Paper", "Pen", "Pencil", "Ruler", "Sharpener", "Tape"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Stationery"
        
        //button visibility
        goButton.isHidden = true
        //emitter
        subtleAnimate()
        
        //displayLink
        let displaylink = CADisplayLink(target: self, selector: #selector(handleUpdate))
    }
    
    @objc func handleUpdate(){
        let seconds = Date()
    }
    
    @IBAction func showImage(_ sender: Any) {
        let number:Int = Int (arc4random_uniform(12));
        
        imageRandom.image = UIImage (named: imageNames[number]);
        imageRandom.layer.cornerRadius = 12
        randomGetLabel.text = imageNames[number]
        isCellSelected.toggle()
        
        if isCellSelected{
            goButton.isHidden = false
            randomButton.isHidden = true
        }
        
    }
    

    @IBAction func goTapped(_ sender: Any) {
        performSegue(withIdentifier: "timer", sender: nil)
    }
    
    @IBAction func unWindToRandom(_ sender:UIStoryboardSegue){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //bg emitter
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
