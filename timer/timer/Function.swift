//
//  Function.swift
//  timer
//
//  Created by Olivia Dwi  Susanti on 10/04/21.
//

import UIKit

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
