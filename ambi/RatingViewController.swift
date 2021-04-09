//
//  RatingViewController.swift
//  ambi
//
//  Created by Nicholas Kusuma on 09/04/21.
//

import UIKit
import StoreKit

class RatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SKStoreReviewController.requestReview()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
