//
//  FontPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/19/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class FontPickerViewController: UIViewController  {
    
    //MARK: BUttons
    @IBOutlet weak var typewriterFont: UIButton!
    @IBOutlet weak var bradFont: UIButton!
    @IBOutlet weak var dusterFont: UIButton!
    @IBOutlet weak var coinyFont: UIButton!
    @IBOutlet weak var papyrusFont: UIButton!
    @IBOutlet weak var copperFont: UIButton!
    @IBOutlet weak var didotFont: UIButton!
    @IBOutlet weak var snellFont: UIButton!
    @IBOutlet weak var helveticaFont: UIButton!
    
    //MARK: Properties
    var unwindFontToEditStylesSegueID = "unwindFontToEditStyles"
    var selectedFont: UIFont?
    var identifier: StyleSender?
    var numberOfButtons : Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // highlight passed in font value
        for tagValue in 101...(100+numberOfButtons)
        {
            let button = self.view.viewWithTag(tagValue) as! UIButton
            let buttonFont = button.attributedTitle(for: UIControl.State.normal)!.attribute(NSAttributedString.Key.font, at: 0, effectiveRange: nil) as! UIFont
            if  buttonFont.fontName == selectedFont?.fontName {
                button.isSelected = true
            }
        }
    }
    
    @IBAction func fontSelected(_ sender: UIButton) {
        let newFont = sender.attributedTitle(for: UIControl.State.normal)?.attribute(NSAttributedString.Key.font, at: 0, effectiveRange: nil) as! UIFont
        print(newFont.fontName)
        self.disableButtons()
        sender.isSelected = true
        self.selectedFont = UIFont(name: newFont.fontName, size: 40)
    }
    
    func disableButtons() {
        for tagValue in 101...(100+numberOfButtons)
        {
            let button = self.view.viewWithTag(tagValue) as! UIButton
            button.isSelected = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.unwindFontToEditStylesSegueID {
            let font = self.selectedFont
            let controller = segue.destination as! EditTextStylesViewController
            
            if self.identifier == StyleSender.topFont {
                controller.topTextProperties![NSAttributedString.Key.font] = font
            } else if self.identifier == StyleSender.bottomFont {
                controller.bottomTextProperties![NSAttributedString.Key.font] = font
            } else {
                print("ERROR in Style Enum while Setting Colors")
            }
            
            controller.setViewTextDisplays()
        }
    }

    @IBAction func cancelFontChoice(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
