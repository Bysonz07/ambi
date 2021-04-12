//
//  GradientView.swift
//  timer
//
//  Created by Olivia Dwi  Susanti on 10/04/21.
//

import UIKit

@IBDesignable
class gradientView: UIView {

    @IBInspectable var topColor: UIColor =  #colorLiteral(red: 0.4, green: 0.3607843137, blue: 1, alpha: 1)
    @IBInspectable var bottomColor: UIColor =  #colorLiteral(red: 0.5882352941, green: 0.8549019608, blue: 0.9176470588, alpha: 1)
    
    var startPointX: CGFloat = 0
    var startPointY: CGFloat = 0
    var endPointX: CGFloat = 1
    var endPointY: CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer ()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

