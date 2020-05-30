//
//  FontPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/19/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class FontPickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //MARK: Fonts
    var fontButtons: [Font]! = Font.allFonts
    
    //MARK: Properties
    var unwindFontToEditStylesSegueID = "unwindFontToEditStyles"
    var fontTableCellID = "fontTableCell"
    var selectedFont: UIFont?
    var identifier: StyleSender?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // highlight table cell for passed in font value
        
        for f in fontButtons {
            if f.fontSysName.fontName == self.selectedFont?.fontName {
                
            }
        }

    }
    
    //MARK: Table View Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fontButtons.count
    }
    
    //MARK: Table View Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.fontTableCellID)!
        let thisFont = self.fontButtons[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.attributedText = NSAttributedString(string: thisFont.fontName, attributes: [NSAttributedString.Key.font : thisFont.fontSysName])
        
        return cell
    }
    
    //MARK: Table View Selection Action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newFont = self.fontButtons[indexPath.row]
        self.selectedFont = UIFont(name: newFont.fontSysName.fontName, size: 40)
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
