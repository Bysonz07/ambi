//
//  Emitter.swift
//  ambi
//
//  Created by Difa N Pratama on 05/04/21.
//

import UIKit

class Emitter{
    static func getEmitter(with image: UIImage, range: CGFloat) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: image, range: range)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage, range: CGFloat) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (45 * (.pi/180))
        cell.emissionRange = (range * (.pi/180))
        
        cell.scale = 0.4
        cell.scaleRange = 0.3
        cells.append(cell)
        return cells
    }
    
}
