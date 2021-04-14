//
//  PlaytimeTableViewController.swift
//  ambi
//
//  Created by Nicholas Kusuma on 09/04/21.
//

import UIKit

class PlaytimeTableViewController: UITableViewController {

    //stepper item
    @IBOutlet weak var stepperItemsPerRound: UIStepper!
    @IBOutlet weak var totalItemsPerRound: UILabel!
    
//    Switch spelling Bee
    @IBOutlet weak var spellingSwitch: UISwitch!
    
    //stepper waktu
    @IBOutlet weak var totalWaktuPerRound: UILabel!
    @IBOutlet weak var stepperWaktuPerRound: UIStepper!
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.preferredContentSize = self.view.systemLayoutSizeFitting(
//            UIView.layoutFittingCompressedSize
//        )
//    }
    var spellState = "spellState"
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        super.viewWillAppear(animated)
//        self.preferredContentSize = self.view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        self.navigationController!.preferredContentSize = CGSize(width:375,height:200)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let keadaanSpelling = defaults.bool(forKey: spellState)
        //spelling switch
        spellingSwitch.isOn = keadaanSpelling
        spellingSwitch.isOn = defaults.bool(forKey: spellState)
        
        // ini stepper item
        stepperItemsPerRound.value = defaults.double(forKey: "BanyakItem")
        print(stepperItemsPerRound.value)
        let itemsPerRound = String(format: "%.0f", stepperItemsPerRound.value)
        totalItemsPerRound.text = "\(itemsPerRound) Total Items"
        
        // ini stepper waktu
        stepperWaktuPerRound.value = defaults.double(forKey: "LamaWaktu")
        let waktuPerRound = String(format: "%.0f", stepperWaktuPerRound.value)
        totalWaktuPerRound.text = "Countdown \(waktuPerRound)s"
        
    }

    @IBAction func actionTotalItemsPerRound(_ sender: UIStepper) { banyakItemsPerRound() 
    }
    
    @IBAction func actionTotalWaktuPerRound(_ sender: UIStepper) { lamaWaktuPerRound()
    }
    
    
    @IBAction func actionSpell(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        if spellingSwitch.isOn {
            
            print("Play Spell")
//            spellPlayer.play()
            print("SpellState \(String(describing: defaults.value(forKey: spellState)))")
        }
        else {
            print("Pause Spell")
//            spellPlayer.pause()
            print("SpellState \(defaults.value(forKey: spellState) ?? spellState)")
        }
        
        
        defaults.set(spellingSwitch.isOn, forKey: spellState)
    }
    // MARK: - Table view data source
    func banyakItemsPerRound () {
        let itemsPerRound = String(format: "%.0f", stepperItemsPerRound.value)
        totalItemsPerRound.text = "\(itemsPerRound) Total Items"
        
        let defaults = UserDefaults.standard
        defaults.set(stepperItemsPerRound.value, forKey: "BanyakItem")
    }
    
    func lamaWaktuPerRound () {
        let waktuPerRound = String(format: "%.0f", stepperWaktuPerRound.value)
        totalWaktuPerRound.text = "Countdown \(waktuPerRound)s"
        
        let defaults = UserDefaults.standard
        defaults.set(stepperWaktuPerRound.value, forKey: "LamaWaktu")
    }

  
}
