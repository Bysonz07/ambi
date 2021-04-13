//
//  SettingsTableViewController.swift
//  ambi
//
//  Created by Nicholas Kusuma on 09/04/21.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var musicSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController!.preferredContentSize = CGSize(width:375,height:300)
        
        let defaults = UserDefaults.standard
        
        //ambil nilai music state dari kotak, simpan di var keadaanMusik
        let keadaanMusik = defaults.bool(forKey: "musicState")
        
        // set nilai properti is on dari musicSwitch dengan isi variable keadaanMusik
        musicSwitch.isOn = keadaanMusik
        
        musicSwitch.isOn = defaults.bool(forKey: "musicState")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func actionMusic(_ sender: UISwitch) {
        if musicSwitch.isOn {
            musicPlayer.play()
        }
        else {
            musicPlayer.pause()
        }
        
        let defaults = UserDefaults.standard
        defaults.set(musicSwitch.isOn, forKey: "musicState")
        
    }
    }
    // MARK: - Table view data source

  

