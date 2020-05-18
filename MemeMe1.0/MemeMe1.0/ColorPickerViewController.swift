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
    
    // MARK: Properties
    var redValue: CGFloat?
    var greenValue: CGFloat?
    var blueValue: CGFloat?
    var alphaValue: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.redSlider.value = Float(self.redValue ?? 0)
        self.greenSlider.value = Float(self.greenValue ?? 0)
        self.blueSlider.value = Float(self.blueValue ?? 0)
        self.chageColor()
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
        
        self.redValue = CGFloat(self.redSlider.value)
        self.greenValue = CGFloat(self.greenSlider.value)
        self.blueValue = CGFloat(self.blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: self.redValue!, green: self.greenValue!, blue: self.blueValue!, alpha: self.alphaValue)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
