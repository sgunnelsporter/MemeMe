//
//  ViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 4/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // If camera is not available on device, disable the camera button
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }


    @IBAction func chooseFromAlbum(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func takeNewPicture(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
}

