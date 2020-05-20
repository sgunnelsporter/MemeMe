//
//  FontPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/19/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class FontPickerViewController: UIViewController {
    
    //MARK: Properties
    var unwindFontToEditStylesSegueID = "unwindFontToEditStyles"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelFontChoice(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
