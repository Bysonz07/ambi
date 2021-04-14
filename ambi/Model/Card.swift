//
//  Card.swift
//  ambi
//
//  Created by Difa N Pratama on 13/04/21.
//

import Foundation

let itemNames = ["Book", "Brush", "Crayon", "Eraser", "Glue", "Highlighter", "Paper", "Pen", "Pencil", "Ruler", "Sharpener", "Tape"];

let itemOutlineNames = ["BookOutline", "BrushOutline", "CrayonOutline", "EraserOutline", "GlueOutline", "HighlighterOutline", "PaperOutline", "PenOutline", "PencilOutline", "RulerOutline", "SharpenerOutline", "TapeOutline"];

class Card {
    public static var stopRonde = 1
    
    public static var nameChosen : [String] = []
    
    public static var userChosen : [String] = []
    
    public static var pathChosen = 0
}
