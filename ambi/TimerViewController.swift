//
//  TimerViewController.swift
//  ambi
//
//  Created by Difa N Pratama on 13/04/21.
//

import UIKit

class TimerViewController: UIViewController {

    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(runCountdown))
    lazy var dlPrepare = CADisplayLink(target: self, selector: #selector(runPreparation))
    var indexImage = 0
    
    //Preparation Time
    @IBOutlet weak var playTimeLabel: UILabel!
    @IBOutlet weak var prepareTimeLabel: UILabel!
    
    //Countdown
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var gifAnimation1: UIImageView!
    @IBOutlet weak var gifAnimation2: UIImageView!
    
    var timerCountdown = Timer()
    let defaults = UserDefaults.standard
    var counter = 0
    var preparer = 4
    var resumeTapped = false
    var itemName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = defaults.value(forKey: "LamaWaktu") as! Int
        
        
        //selected
//        pauseButton.setImage(UIImage.init(systemName: "play.circle.fill"), for: .selected)
        
        //initial countdown vis
        prepareTimeLabel.isHidden = false
        playTimeLabel.isHidden = false
        countdownLabel.isHidden = true
        itemLabel.isHidden = true
        repeatButton.isHidden = true
        pauseButton.isHidden = true
        nextButton.isHidden = true
        gifAnimation1.isHidden = true
        gifAnimation2.isHidden = true
        
//        //init countdown vis
//        countdownLabel.isHidden = false
//        itemLabel.isHidden = false
//        repeatButton.isHidden = false
//        pauseButton.isHidden = false
//        nextButton.isHidden = false
//        gifAnimation1.isHidden = false
//        gifAnimation2.isHidden = false
        
//        if countdownLabel.isHidden == false{
//            //progress bar
//            backgroundProgressBar()
//            progressBarRun()
//
//            // countdown
//            itemName = "PENCIL"
//
//            countdownTimer()
//            startAnimationProgressBar()
//
//
//        }
        
        // countdown
        itemName = itemNames[indexImage]
        
        //progress bar
//        backgroundProgressBar()
//        progressBarRun()
//
//        countdownTimer()
//        startAnimationProgressBar()
        prepareTimer()
        //emitter
        subtleAnimate()
        
//        //get passing data
//        NotificationCenter.default.addObserver(self, selector: #selector(getRandom), name: Notification.Name("randomV"), object: nil)
        
        //navigation setting
        self.navigationItem.title = "Stationery"
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Baloo2-Medium", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
        // animate
        animateImageSequence(image1: "\(itemNames[indexImage])Outline.png", image2: "\(itemNames[indexImage])02", image3: "\(itemNames[indexImage])03", uiImageView: gifAnimation1)
        animateImageSequence(image1: "\(itemNames[indexImage])Outline.png", image2: "\(itemNames[indexImage])02", image3: "\(itemNames[indexImage])03", uiImageView: gifAnimation2)
        
    }
    
    @objc func getRandom(_ notification: Notification) -> Int{
        let numbers = notification.object as! Int
        indexImage = numbers
        return indexImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVc = segue.destination as! SpellingBeeViewController
        destVc.indexImages = indexImage
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
        basicAnimation.duration = CFTimeInterval(Double (counter + (counter/5)))
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
    
    // Preparation
    @objc private func runPreparation() {
        preparer -= 1
        prepareTimeLabel.text = "\(preparer)"
        
        
        if preparer <= 0 {
            timerCountdown.invalidate()
            prepareTimeLabel.isHidden = true
            playTimeLabel.isHidden = true
            
            //init countdown vis
            countdownLabel.isHidden = false
            itemLabel.isHidden = false
            repeatButton.isHidden = false
            pauseButton.isHidden = false
            nextButton.isHidden = false
            gifAnimation1.isHidden = false
            gifAnimation2.isHidden = false
            
            //start
            backgroundProgressBar()
            progressBarRun()
            
            countdownTimer()
            startAnimationProgressBar()
//            itemLabel.text = ""
            dlPrepare.remove(from: .current, forMode: .common)
        }
    }
    
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
    
    func prepareTimer() {
        dlPrepare.preferredFramesPerSecond = 1
        dlPrepare.add(to: .current, forMode: .common)
        
        prepareTimeLabel.text = "\(preparer)"
//        itemLabel.text = itemName
//        timerCountdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
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
        counter = defaults.value(forKey: "LamaWaktu") as! Int
        countdownLabel.text = String(counter)
        itemLabel.text = String(itemName)
        countdownTimer()
        startAnimationProgressBar()
        displayLink.remove(from: .current, forMode: .common)
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: .current, forMode: .common)
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            sender.setImage(UIImage.init(systemName: "play.circle.fill"), for: .normal)
            timerCountdown.invalidate()
            self.resumeTapped = true
            pauseAnimationProgressBar()
            displayLink.isPaused = true
        } else {
            self.resumeTapped = false
            countdownTimer()
            sender.setImage(UIImage.init(systemName: "pause.circle"), for: .normal)

            resumeAnimationProgressBar()
            displayLink.isPaused = false
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        performSegue(withIdentifier: "spellingBee", sender: nil)
    }
    func animateImageSequence(image1 : String = "Pencil01.png", image2 : String = "Pencil02.png", image3 : String = "Pencil03.png", uiImageView : UIImageView) {
            var animatedImage1 : UIImage!
            var animatedImage2 : UIImage!
            var animatedImage3 : UIImage!
            var animatedImages : [UIImage]!
            var animatedImageFix: UIImage!
            
            animatedImage1 = UIImage (named: image1)
            animatedImage2 = UIImage (named: image2)
            animatedImage3 = UIImage (named: image3)
    //        animatedImage2 = animatedImage1.withHorizontallyFlippedOrientation()
            animatedImages = [animatedImage1, animatedImage2, animatedImage3]
            animatedImageFix = UIImage.animatedImage(with: animatedImages, duration: 2.0)
            uiImageView.image = animatedImageFix
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
