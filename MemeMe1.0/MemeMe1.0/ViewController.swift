//
//  ViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 4/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //MARK: View state variables
    var activeTextField: UITextField?

    // MARK: View Outlet Defitions
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    //MARK: Default Text attributes
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  Float(3)
    ]
    
    
    //MARK: Set-up and Release of ViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // If camera is not available on device, disable the camera button
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        // Set textField defaults
        topText.delegate = self
        topText.defaultTextAttributes = memeTextAttributes
        topText.textAlignment = .center

        bottomText.delegate = self
        bottomText.defaultTextAttributes = memeTextAttributes
        bottomText.textAlignment = .center
        
        // Set-up notification listening for keyboard actions
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Disable notification listening for keyboard actions
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Image Picking Control
    @IBAction func chooseFromAlbum(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func takeNewPicture(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.memeImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Text Field Display Control
    func textFieldDidBeginEditing(_ textField: UITextField) {
      // set the activeTextField to the selected textfield
      self.activeTextField = textField
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        // Get keyboard display size
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        
        // only if the active text field is going to be covered by the keyboard shift view
        if let activeTextField = activeTextField {

          let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
          
            let topOfKeyboard = self.view.frame.height - keyboardSize.cgRectValue.height

          // if the bottom of Textfield is below the top of keyboard, move up
          if bottomOfTextField > topOfKeyboard {
            view.frame.origin.y -= keyboardSize.cgRectValue.height
          }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        // return view back to origin
        view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // set active text field back to default state and dismiss keyboard
        self.activeTextField = nil
        textField.resignFirstResponder()
        return true
    }
}

