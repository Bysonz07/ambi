//
//  animasiAmbi.swift
//  ambil1
//
//  Created by Jehnsen Hirena Kane on 08/04/21.
//

import UIKit
import AVFoundation

class AmbiBrain{
    
    

    //movement
    func animateMovement(_ layer : CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + layer.frame.size.width/2,
                                      y: layer.frame.origin.y + layer.frame.size.height/2)
        animation.toValue = CGPoint(x: 700, y: 600)
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = true
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    
    //opacity
    func animateOpacity(_ layer : CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    
    func animateOpacityToZero(_ layer : CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.25
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
    }
    
    //scaling
    func animateScale(_ layer : CALayer){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 4
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.isRemovedOnCompletion = true
        animation.fillMode = CAMediaTimingFillMode.removed
        animation.autoreverses = true
        layer.add(animation, forKey: nil)
    }
    
    func playSound(musicName: String , musicExtension: String = "mp3") {
        let url = Bundle.main.url(forResource: musicName, withExtension: musicExtension)
        spellPlayer.volume = 0.7
        spellPlayer = try! AVAudioPlayer(contentsOf: url!)
        spellPlayer.play()
    }
    
    func playLotterySound(musicName: String , musicExtension: String = "mp3") {
        let url = Bundle.main.url(forResource: musicName, withExtension: musicExtension)
        spellPlayer = try! AVAudioPlayer(contentsOf: url!)
        spellPlayer.numberOfLoops = 15
        spellPlayer.play()
    }
    
    func stopSound(musicName: String , musicExtension: String = "mp3") {
        let url = Bundle.main.url(forResource: musicName, withExtension: musicExtension)
        spellPlayer = try! AVAudioPlayer(contentsOf: url!)
        spellPlayer.stop()
    }
    
    func animateText(text : String = "Cingcaripit",selectedLabel : UILabel) {
        selectedLabel.text = ""
        for char in text {
            selectedLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.3)
        }
        
        
    }
    
    //animate sequence
    func animateImageSequence(image1 : String = "Pencil01.png", image2 : String = "Pencil02.png", image3 : String = "Pencil03.png", image4 : String = "Pencil02.png", image5 : String = "Pencil03.png", uiImageView : UIImageView) {
        var animatedImage1 : UIImage!
        var animatedImage2 : UIImage!
        var animatedImage3 : UIImage!
        var animatedImage4 : UIImage!
        var animatedImage5 : UIImage!
        var animatedImages : [UIImage]!
        var animatedImageFix: UIImage!
        
        animatedImage1 = UIImage (named: image1)
        animatedImage2 = UIImage (named: image2)
        animatedImage3 = UIImage (named: image3)
        animatedImage4 = UIImage (named: image4)
        animatedImage5 = UIImage (named: image5)
        animatedImages = [animatedImage1, animatedImage2, animatedImage3, animatedImage4,animatedImage5]
    
        animatedImageFix = UIImage.animatedImage(with: animatedImages, duration: 2.0)
        uiImageView.image = animatedImageFix
    }
    
    func animateBarangMasok(uiIMageView1 : UIImageView, uiImageView2 : UIImageView, uiImageView3 : UIImageView, transitionDuration : TimeInterval) {
        var animatedImage6 : UIImage!
        var animatedImage7 : UIImage!
        var animatedImage8 : UIImage!
        
        animatedImage6 = UIImage (named: "Book.png" )
        animatedImage7 = UIImage (named: "Brush.png")
        animatedImage8 = UIImage (named: "Crayon.png")
        
        uiIMageView1.image = animatedImage6
        uiImageView2.image = animatedImage7
        uiImageView3.image = animatedImage8
        
        UIView.transition(with: uiIMageView1, duration: transitionDuration, options: .transitionCrossDissolve, animations:{
            uiIMageView1.image = animatedImage6;
        }, completion: nil)
        UIView.transition(with: uiImageView2, duration: transitionDuration, options: .transitionCrossDissolve, animations:{
            uiImageView2.image = animatedImage7;
        }, completion: nil)
        UIView.transition(with: uiImageView3, duration: transitionDuration, options: .transitionCrossDissolve, animations:{
            uiImageView3.image = animatedImage8;
        }, completion: nil)
    }
    
    func animateLabelMasok(_ label1 : UILabel, _ label2 : UILabel, _ label3 : UILabel) {
        let transitionDuration : TimeInterval = 1
        
        UIView.transition(with: label1, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label1.text = "Eraser"}, completion: nil)
        UIView.transition(with: label2, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label2.text = "Crayon"}, completion: nil)
        UIView.transition(with: label3, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label3.text = "Ruler"}, completion: nil)
        
    }
    
    //jugling
    func clearJuglingText (text : String, listOfLabels : [UILabel]!) {
        let listOfCharacters = Array(text)
        
        for i in 0...listOfLabels.count - 1 {
            listOfLabels[i].text = ""
            listOfLabels[i].font = UIFont(name: "Baloo2-Bold", size: 70)
        }
        
        for i in 0...listOfCharacters.count - 1 {
            listOfLabels[i].text = String(listOfCharacters[i])
            //            RunLoop.current.run(until: Date()+1)
        }
    }
    
    
    
    func juglingText(text : String, listOfLabels : [UILabel]!) {
        let listOfCharacters = Array(text)
        let animation = CABasicAnimation(keyPath: "transform.scale")
        var musicName1 : String

        
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.5
        animation.autoreverses = true
        
        
        
        for i in 0...listOfCharacters.count - 1 {
            listOfLabels[i].layer.add(animation, forKey: nil)
            musicName1 = "audio" + String(listOfCharacters[i]).capitalized
            playSound(musicName: musicName1)
            RunLoop.current.run(until: Date()+1)
        }
        
        playSound(musicName: "audio" + String(text).capitalized)
        
    }
    
    
}


