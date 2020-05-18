//
//  EditTextStylesViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/16/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

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
    enum FontSender {
        case top
        case bottom
    }
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set-up the text displays
        self.topTextDisplay.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
        self.bottomTextDisplay.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)

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
            
        }
        
        if segue.identifier == self.changeTopBorderColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let borderColor = self.topTextProperties![NSAttributedString.Key.strokeColor] as! UIColor
            
            let ciColor = CIColor(color: borderColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
        }
        
        if segue.identifier == self.changeBottomTextColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let textColor = self.bottomTextProperties![NSAttributedString.Key.foregroundColor] as! UIColor
            
            let ciColor = CIColor(color: textColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
        }
        
        if segue.identifier == self.changeBottomBorderColorSegueID {
            
            let controller = segue.destination as! ColorPickerViewController
            let borderColor = self.bottomTextProperties![NSAttributedString.Key.strokeColor] as! UIColor
            
            let ciColor = CIColor(color: borderColor)
            controller.alphaValue = ciColor.alpha
            controller.redValue = ciColor.red
            controller.greenValue = ciColor.green
            controller.blueValue = ciColor.blue
            
        }
        
        if segue.identifier == self.setChangesBackToMainSegueID {
            let controller = segue.destination as! ViewController
            
            controller.topTextProperties = self.topTextProperties!
            controller.bottomTextProperties = self.bottomTextProperties!
            controller.topText.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
            controller.bottomText.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)
        }
    }
    
    //MARK: Change font button actions
    @IBAction func changeTopTextFont(_ sender: Any) {
        self.presentFontChanger(FontSender.top, text: self.topText!)
    }
    
    @IBAction func changeBottomTextFont(_ sender: Any) {
        self.presentFontChanger(FontSender.bottom, text: self.bottomText!)
    }
    
    func presentFontChanger(_ id: FontSender, text: String) {
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
        
        // Present Alter
        self.present(controller, animated: true, completion: nil)
    }
    
    func setTextFont(_ id: FontSender, font: String) {
        if id == FontSender.top {
            self.topTextProperties![NSAttributedString.Key.font] = UIFont(name: font, size: 40)!
            self.topTextDisplay.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
        } else {
            self.bottomTextProperties![NSAttributedString.Key.font] = UIFont(name: font, size: 40)!
            self.bottomTextDisplay.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)
        }
    }
    
    //MARK: Unwind back from Color Picker
     @IBAction func unwindToEditStyles(_ sender: UIStoryboardSegue) {
         
     }
    
    //MARK: Cancel Button Action
    @IBAction func cancelChanges(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   // @IBAction func finishChanges(_ sender: Any) {
        // Do Stuff!!!
        
   //     self.dismiss(animated: true, completion: nil)
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
