//
//  animasiAmbi.swift
//  ambil1
//
//  Created by Jehnsen Hirena Kane on 08/04/21.
//

import UIKit
import AVFoundation

class AmbiBrain{
    
    var musicPlayer : AVAudioPlayer!

    
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
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        musicPlayer.play()
    }
    
    func animateText(text : String = "Cingcaripit",selectedLabel : UILabel) {
        selectedLabel.text = ""
        for char in text {
            selectedLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.3)
        }
        
        
    }
    
    
    func animateImageSequence(image1 : String = "penghapus.png", image2 : String = "crayon.png", image3 : String = "penggares.png", image4 : String = "pencil.png", image5 : String = "notes.png", uiImageView : UIImageView) {
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
    
    func animateBarangMasok(itemName : String, uiIMageView1 : UIImageView, transitionDuration : TimeInterval) {
        var animatedImage : UIImage!
                
        animatedImage = UIImage (named: itemName )
        
        uiIMageView1.image = animatedImage
       
        UIView.transition(with: uiIMageView1, duration: transitionDuration, options: .transitionCrossDissolve, animations:{
            uiIMageView1.image = animatedImage;
        }, completion: nil)
        
    }
    
    func animateLabelMasok(_ label1 : UILabel, _ label2 : UILabel, _ label3 : UILabel) {
        let transitionDuration : TimeInterval = 1
        
        UIView.transition(with: label1, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label1.text = "penghapus"}, completion: nil)
        UIView.transition(with: label2, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label2.text = "krayon"}, completion: nil)
        UIView.transition(with: label3, duration: transitionDuration, options: .transitionCrossDissolve, animations: {label3.text = "penggares"}, completion: nil)
        
    }
    func clearJuglingText (text : String, listOfLabels : [UILabel]!) {
        let listOfCharacters = Array(text)
        
        for i in 0...listOfLabels.count - 1 {
            listOfLabels[i].text = ""
            listOfLabels[i].font = UIFont.systemFont(ofSize: 70)
        }
        
        for i in 0...listOfCharacters.count - 1 {
            listOfLabels[i].text = String(listOfCharacters[i])
            //            RunLoop.current.run(until: Date()+1)
        }
    }
    
    
    
    func juglingText(text : String, listOfLabels : [UILabel]!) {
        let listOfCharacters = Array(text)
        let animation = CABasicAnimation(keyPath: "transform.scale")

        
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.5
        animation.autoreverses = true
        
        
        
        for i in 0...listOfCharacters.count - 1 {
            listOfLabels[i].layer.add(animation, forKey: nil)
            RunLoop.current.run(until: Date()+1)
        }
        
    }
    
    
}


