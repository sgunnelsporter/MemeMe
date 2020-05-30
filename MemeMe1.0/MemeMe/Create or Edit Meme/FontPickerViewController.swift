//
//  FontPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/19/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class FontPickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //MARK: BUttons
    /*@IBOutlet weak var typewriterFont: UIButton!
    @IBOutlet weak var bradFont: UIButton!
    @IBOutlet weak var dusterFont: UIButton!
    @IBOutlet weak var coinyFont: UIButton!
    @IBOutlet weak var papyrusFont: UIButton!
    @IBOutlet weak var copperFont: UIButton!
    @IBOutlet weak var didotFont: UIButton!
    @IBOutlet weak var snellFont: UIButton!
    @IBOutlet weak var helveticaFont: UIButton!*/
    
    //MARK: Fonts
    var fontButtons: [NSAttributedString]! = Font.createFontButtons()
    
    //MARK: Properties
    var unwindFontToEditStylesSegueID = "unwindFontToEditStyles"
    var fontTableCellID = "fontTableCell"
    var selectedFont: UIFont?
    var identifier: StyleSender?
    var numberOfButtons : Int = 10

    // highlight table cell for passed in font value

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fontButtons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.fontTableCellID)!
        let font = self.fontButtons[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.attributedText = font
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    @IBAction func fontSelected(_ sender: UIButton) {
       /* let newFont = sender.attributedTitle(for: UIControl.State.normal)?.attribute(NSAttributedString.Key.font, at: 0, effectiveRange: nil) as! UIFont
        self.disableButtons()
        sender.isSelected = true
        self.selectedFont = UIFont(name: newFont.fontName, size: 40)*/
    }
    
    func disableButtons() {
        /*for tagValue in 101...(100+numberOfButtons)
        {
            let button = self.view.viewWithTag(tagValue) as! UIButton
            button.isSelected = false
        }*/
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
