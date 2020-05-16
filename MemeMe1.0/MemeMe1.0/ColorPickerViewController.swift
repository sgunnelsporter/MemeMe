//
//  ColorPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/16/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPicker(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishedPicker(_ sender: Any) {
        // Do Stuff!!
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
