//
//  MixViewController.swift
//  timer
//
//  Created by Olivia Dwi  Susanti on 10/04/21.
//

import UIKit

class MixViewController: UIViewController {

    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(runCountdown))
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var gifAnimation1: UIImageView!
    @IBOutlet weak var gifAnimation2: UIImageView!
    
    var timerCountdown = Timer()
    var counter = 15
    var resumeTapped = false
    var itemName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animate
        animateImageSequence(image1: "pencil01.png", uiImageView: gifAnimation1)
        animateImageSequence(image1: "PencilOutline.png", uiImageView: gifAnimation2)
        
        //progress bar
        backgroundProgressBar()
        progressBarRun()
        
        // countdown
        itemName = "PENCIL"
        
        countdownTimer()
        startAnimationProgressBar()
    }
    
    //progress bar
    func backgroundProgressBar() {
        // for background progress bar
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 250, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = #colorLiteral(red: 0.8705882353, green: 0.2509803922, blue: 0.5333333333, alpha: 0.3)
        trackLayer.strokeEnd = 3
        view.layer.insertSublayer(trackLayer, at: 1)
    }
    
    func progressBarRun() {
        // progress bar run
        let centerRun = view.center
        let circularPathRun = UIBezierPath(arcCenter: centerRun, radius: 250, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPathRun.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.9725490196, green: 0.5215686275, blue: 0.6392156863, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = #colorLiteral(red: 0.8705882353, green: 0.2509803922, blue: 0.5333333333, alpha: 0.3)
        shapeLayer.strokeEnd = 0
        view.layer.insertSublayer(shapeLayer, at: 2)
    }
    
    @objc private func startAnimationProgressBar() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(Double (counter + counter * Int(0.6)))
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.isAdditive = true
        shapeLayer.add(basicAnimation, forKey: "animationProgressBarStarted")
    }
    
    func pauseAnimationProgressBar() {
        let timeSincePaused = shapeLayer.convertTime(CACurrentMediaTime(), from: nil)
        shapeLayer.speed = 0
//        stopAnimationProgressBar()
        shapeLayer.timeOffset = timeSincePaused
        print (timeSincePaused)
    }
    
    func resumeAnimationProgressBar() {
        let pausedTime = shapeLayer.timeOffset
        shapeLayer.speed = 1
        shapeLayer.timeOffset = 0
        shapeLayer.beginTime = 0
        let timeSincePaused = shapeLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        print(timeSincePaused)
        shapeLayer.beginTime = timeSincePaused
    }
    
//    func stopAnimationProgressBar() {
//        shapeLayer.removeAnimation(forKey: "pauseAnimationProgressBar")
//    }
    
    // countdown
    @objc private func runCountdown() {
        counter -= 1
        countdownLabel.text = "\(counter)"
        
        
        if counter <= 0 {
            timerCountdown.invalidate()
            countdownLabel.text = "Times Up!"
            itemLabel.text = ""
            displayLink.remove(from: .current, forMode: .common)
        }
    }
    
    func countdownTimer() {
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: .current, forMode: .common)
        
        countdownLabel.text = "\(counter)"
        itemLabel.text = itemName
//        timerCountdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
    }
    
    
    
    // button countdown
    @IBAction func repeatTapped(_ sender: Any) {
        timerCountdown.invalidate()
        counter = 10
        countdownLabel.text = String(counter)
        itemLabel.text = String(itemName)
        countdownTimer()
        startAnimationProgressBar()
        displayLink.remove(from: .current, forMode: .common)
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: .current, forMode: .common)
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        if self.resumeTapped == false {
            timerCountdown.invalidate()
            self.resumeTapped = true
//            pauseButton.setImage(UIImage(named: "pause.circle"), for: .normal)
            pauseAnimationProgressBar()
            displayLink.isPaused = true
        } else {
            self.resumeTapped = false
            countdownTimer()
//            pauseButton.setImage(UIImage(named: "play.circle"), for: .normal)
            resumeAnimationProgressBar()
            displayLink.isPaused = false
        }
    }
}
