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
    @IBOutlet weak var dusterFont: UIButton!
    @IBOutlet weak var coinyFont: UIButton!
    @IBOutlet weak var dancingFont: UIButton!
    @IBOutlet weak var momFont: UIButton!
    @IBOutlet weak var papyrusFont: UIButton!
    @IBOutlet weak var ralewayFont: UIButton!
    @IBOutlet weak var snellFont: UIButton!
    @IBOutlet weak var vesperFont: UIButton!
    
    //MARK: Properties
    var unwindFontToEditStylesSegueID = "unwindFontToEditStyles"

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelFontChoice(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
