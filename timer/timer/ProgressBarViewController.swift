//
//  ProgressBarViewController.swift
//  timer
//
//  Created by Olivia Dwi  Susanti on 10/04/21.
//

import UIKit

class ProgressBarViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        //  create my track layer
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 250, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = #colorLiteral(red: 1, green: 0.7881135345, blue: 0.8404712081, alpha: 0.8470588235)
//        trackLayer.lineCap = NSString *CAShapeLayerLineCap
        trackLayer.strokeEnd = 3
        view.layer.addSublayer(trackLayer)
        
//        let circularPath = UIBezierPath(arcCenter: center, radius: 250, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = #colorLiteral(red: 1, green: 0.7881135345, blue: 0.8404712081, alpha: 0.8470588235)
//        shapeLayer.lineCap = NSString *CAShapeLayerLineCap
        
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 15
        
        basicAnimation.fillMode = CAMediaTimingFillMode.init(rawValue: "string")
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "animationOnTap")
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
