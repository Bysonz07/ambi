//
//  ViewController.swift
//  ambi
//
//  Created by Mughie Arief Mughoni on 07/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var imageRandom: UIImageView!
    
    let imageNames = ["Book", "Brush", "Crayon", "Eraser", "Glue", "Highlighter", "Paper", "Pen", "Pencil", "Ruler", "Sharpener", "Tape"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showImage(_ sender: Any) {
        let number:Int = Int (arc4random_uniform(12));
        
        imageRandom.image = UIImage (named: imageNames[number]);
    }
    
}

