//
//  EditTextStylesViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/16/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

enum StyleSender {
    case topText
    case topBorder
    case topFont
    case bottomText
    case bottomBorder
    case bottomFont
}

class EditTextStylesViewController: UIViewController {
    
    // MARK: Properties
    var topText: String?
    var bottomText: String?
    var topTextProperties: [NSAttributedString.Key: Any]?
    var bottomTextProperties: [NSAttributedString.Key: Any]?
    @IBOutlet weak var topTextDisplay: UILabel!
    @IBOutlet weak var bottomTextDisplay: UILabel!
    
    //MARK: Other Properties
    var changeTopTextColorSegueID = "changeTopTextColor"
    var changeTopBorderColorSegueID = "changeTopBorderColor"
    var changeBottomTextColorSegueID = "changeBottomTextColor"
    var changeBottomBorderColorSegueID = "changeBottomBorderColor"
    var setChangesBackToMainSegueID = "setNewTextProperties"
    var changeTopTextFontSegueID = "changeTopTextFont"
    var changeBottomTextFontSegueID = "changeBottomTextFont"
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set-up the text displays
        setViewTextDisplays()

        // Do any additional setup after loading the view.
    }
    
    // MARK: prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.changeTopTextColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let textColor = self.topTextProperties![NSAttributedString.Key.foregroundColor] as! UIColor
            
            let ciColor = CIColor(color: textColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
            controller.identifier = StyleSender.topText
            
        }
        
        if segue.identifier == self.changeTopBorderColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let borderColor = self.topTextProperties![NSAttributedString.Key.strokeColor] as! UIColor
            
            let ciColor = CIColor(color: borderColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
            controller.identifier = StyleSender.topBorder
        }
        
        if segue.identifier == self.changeBottomTextColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let textColor = self.bottomTextProperties![NSAttributedString.Key.foregroundColor] as! UIColor
            
            let ciColor = CIColor(color: textColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
            controller.identifier = StyleSender.bottomText
        }
        
        if segue.identifier == self.changeBottomBorderColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let borderColor = self.bottomTextProperties![NSAttributedString.Key.strokeColor] as! UIColor
            
            let ciColor = CIColor(color: borderColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
            controller.identifier = StyleSender.bottomBorder
            
        }
        
        if segue.identifier == self.changeTopTextFontSegueID {
            let controller = segue.destination as! FontPickerViewController
            let topFont = self.topTextProperties![NSAttributedString.Key.font] as! UIFont
            
            controller.selectedFont = topFont
            controller.identifier = StyleSender.topFont
        }
        
        if segue.identifier == self.changeBottomTextFontSegueID {
            let controller = segue.destination as! FontPickerViewController
            let bottomFont = self.bottomTextProperties![NSAttributedString.Key.font] as! UIFont
            
            controller.selectedFont = bottomFont
            controller.identifier = StyleSender.bottomFont
        }
        
        if segue.identifier == self.setChangesBackToMainSegueID {
            let controller = segue.destination as! CreateMemeViewController
            
            controller.topTextProperties = self.topTextProperties!
            controller.bottomTextProperties = self.bottomTextProperties!
            controller.setTextStyles()
        }
    }
    
    
    //MARK: Set View Displays
    func setViewTextDisplays() {
        self.topTextDisplay.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
        self.bottomTextDisplay.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)
    }
    
    func setTextFont(_ id: StyleSender, font: String) {
           if id == StyleSender.topFont {
               self.topTextProperties![NSAttributedString.Key.font] = UIFont(name: font, size: 40)!
           } else if id == StyleSender.bottomFont {
               self.bottomTextProperties![NSAttributedString.Key.font] = UIFont(name: font, size: 40)!
           } else {
               print("ERROR in Setting Text Font!!")
           }
           setViewTextDisplays()
    }
    
    
    //MARK: Unwind back Pickers
     @IBAction func unwindColorToEditStyles(_ sender: UIStoryboardSegue) {
         
     }
    @IBAction func unwindFontToEditStyles(_ sender: UIStoryboardSegue) {
        
    }
    
    //MARK: Cancel Button Action
    @IBAction func cancelChanges(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
