//
//  ColorPickerViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/16/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: Navigation Controllers
    @IBAction func cancelPicker(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishedPicker(_ sender: Any) {
        // Do Stuff!!
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Color Changer Function
    @IBAction func chageColor() {
        if self.redSlider == nil {
            return
        }
        
        let r : CGFloat = CGFloat(self.redSlider.value)
        let g : CGFloat = CGFloat(self.greenSlider.value)
        let b : CGFloat = CGFloat(self.blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
