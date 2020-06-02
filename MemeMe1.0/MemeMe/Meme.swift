//
//  Meme.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/21/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//
/*
import Foundation
import UIKit

struct Meme {
    var image : UIImage?
    var topText : NSAttributedString?
    var bottomText : NSAttributedString?
    var memedImage : UIImage?
}

extension Meme {
    static let TopTextKey = "TopTextKey"
    static let BottomTextKey = "BottomTextKey"
    static let OriginalImageNameKey = "OriginalImageNameKey"
    static let MemedImageNameKey = "MemedImageNameKey"
    
    init(dictionary: [String : String]) {
    
        self.topText = NSAttributedString(string: dictionary[Meme.TopTextKey]!)
        self.bottomText = NSAttributedString(string: dictionary[Meme.BottomTextKey]!)
        self.image = UIImage(named: dictionary[Meme.OriginalImageNameKey]!)
        self.memedImage = UIImage(named: dictionary[Meme.MemedImageNameKey]!)
        
    }
    
    static var testingMemes: [Meme] {
        var memes = [Meme]()
        
        for m in Meme.loadTestingMemes() {
            memes.append(Meme(dictionary: m))
        }
        
        return memes
    }
    
    static func loadTestingMemes() -> [[String : String]] {
        return [
            [Meme.TopTextKey : "1Top Text", Meme.BottomTextKey : "Bottom Text", Meme.MemedImageNameKey : "pic1", Meme.OriginalImageNameKey : "pic1"],
            [Meme.TopTextKey : "2Top Text", Meme.BottomTextKey : "Bottom Text", Meme.MemedImageNameKey : "pic2", Meme.OriginalImageNameKey : "pic2"],
            [Meme.TopTextKey : "3Top Text", Meme.BottomTextKey : "Bottom Text", Meme.MemedImageNameKey : "pic3", Meme.OriginalImageNameKey : "pic3"],
            [Meme.TopTextKey : "4Top Text", Meme.BottomTextKey : "Bottom Text", Meme.MemedImageNameKey : "pic4", Meme.OriginalImageNameKey : "pic4"],
        ]
    }
}
*/
