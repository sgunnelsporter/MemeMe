//
//  Font.swift
//  MemeMe2.0
//
//  Created by Sarah Gunnels Porter on 5/30/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import Foundation
import UIKit

struct Font {
    
    // MARK: Properties
    
    let fontName: String
    let fontSysName: UIFont
    
    static let NameKey = "NameKey"
    static let SystemNameKey = "SystemNameKey"
    
    // MARK: Initializer

    init(dictionary: [String : String]) {
    
        self.fontName = dictionary[Font.NameKey]!
        self.fontSysName = UIFont(name: dictionary[Font.SystemNameKey]!, size: 24)!
    }
}

// MARK: All Fonts Available

extension Font {

    // Generate an array full of all of the villains in
    static var allFonts: [Font] {
        
        var fonts = [Font]()
        
        for f in Font.fontList() {
            fonts.append(Font(dictionary: f))
        }
        
        return fonts
    }
    
    static func fontList() -> [[String : String]] {
        return [
            [Font.NameKey : "American Typewriter", Font.SystemNameKey : "AmericanTypewriter-Bold"],
            [Font.NameKey : "Bradley Hand", Font.SystemNameKey : "BradleyHandITCTT-Bold"],
            [Font.NameKey : "Chalkduster", Font.SystemNameKey : "Chalkduster"],
            //[Font.NameKey : "Coiny", Font.SystemNameKey : "Coiny-Regular"],
            [Font.NameKey : "Copperplate", Font.SystemNameKey : "Copperplate-Bold"],
            [Font.NameKey : "Courier", Font.SystemNameKey : "Courier-Bold"],
            [Font.NameKey : "Didot", Font.SystemNameKey : "Didot-Bold"],
            [Font.NameKey : "Helvetica", Font.SystemNameKey : "HelveticaNeue-CondensedBlack"],
            [Font.NameKey : "Papyrus", Font.SystemNameKey : "Papyrus"],
            [Font.NameKey : "Party", Font.SystemNameKey : "PartyLetPlain"],
            [Font.NameKey : "Snell Roundhand", Font.SystemNameKey : "SnellRoundhand-Black"],
        ]
    }
    
    static func createFontButtons() -> [NSAttributedString] {
        var fontButtonsArray = [NSAttributedString]()
        for f in self.allFonts {
            fontButtonsArray.append(NSAttributedString(string: f.fontName, attributes: [NSAttributedString.Key.font : f.fontSysName]))
        }
        
        return fontButtonsArray
    }
}
