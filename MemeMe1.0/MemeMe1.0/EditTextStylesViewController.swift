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
        
        if segue.identifier == self.setChangesBackToMainSegueID {
            let controller = segue.destination as! ViewController
            
            controller.topTextProperties = self.topTextProperties!
            controller.bottomTextProperties = self.bottomTextProperties!
            controller.setTextStyles()
        }
    }
    
    //MARK: Change font button actions
    @IBAction func changeTopTextFont(_ sender: Any) {
        let fontController = self.createFontChangerController(StyleSender.topFont, text: self.topText!)
        if let popoverController = fontController.popoverPresentationController {
            popoverController.barButtonItem =  sender as? UIBarButtonItem
        }
        self.present(fontController, animated: true, completion: nil)
    }
    
    @IBAction func changeBottomTextFont(_ sender: Any) {
        let fontController = self.createFontChangerController(StyleSender.bottomFont, text: self.bottomText!)
        if let popoverController = fontController.popoverPresentationController {
            popoverController.barButtonItem =  sender as? UIBarButtonItem
        }
        self.present(fontController, animated: true, completion: nil)
    }
    
    func createFontChangerController(_ id: StyleSender, text: String) -> UIAlertController {
        // Alert Title
        let controller = UIAlertController()
            controller.title = "Choose Font for:"
            controller.message = text
        
        // Alert Fonts
        let helveticaOption = UIAlertAction(title: "Helvetica Neue", style: UIAlertAction.Style.default) { action in
            self.setTextFont(id, font: "HelveticaNeue-CondensedBlack")
        }
        let courierOption = UIAlertAction(title: "Courier", style: UIAlertAction.Style.default) { action in
                   self.setTextFont(id, font: "Courier-Bold")
        }
        let typewriterOption = UIAlertAction(title: "Typewriter", style: UIAlertAction.Style.default) { action in
            self.setTextFont(id, font: "AmericanTypewriter-CondensedBold")
        }
        let fancyOption = UIAlertAction(title: "Fancy", style: UIAlertAction.Style.default) { action in
            self.setTextFont(id, font: "SnellRoundhand-Black")
        }
        let funOption = UIAlertAction(title: "Fun Font", style: UIAlertAction.Style.default) { action in
            self.setTextFont(id, font: "PartyLetPlain")
        }
        
        // Alert Cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        { action in controller.dismiss(animated: true, completion: nil)}

        // Attach Actions
        controller.addAction(helveticaOption)
        controller.addAction(courierOption)
        controller.addAction(typewriterOption)
        controller.addAction(fancyOption)
        controller.addAction(funOption)
        controller.addAction(cancelAction)
        
        // return Alert
        return controller
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
    
    
    //MARK: Set View Displays
    func setViewTextDisplays() {
        self.topTextDisplay.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
        self.bottomTextDisplay.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)
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
