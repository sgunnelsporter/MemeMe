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
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set-up the text displays
        self.topTextDisplay.attributedText = NSAttributedString(string: self.topText ?? "ERROR", attributes: self.topTextProperties)
        self.bottomTextDisplay.attributedText = NSAttributedString(string: self.bottomText ?? "ERROR", attributes: self.bottomTextProperties)

        // Do any additional setup after loading the view.
    }
    
    //MARK: Cancel Button Action
    @IBAction func CancelStyleChanges(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
