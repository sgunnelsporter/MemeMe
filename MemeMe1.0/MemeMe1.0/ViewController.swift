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
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: Default Text attributes
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
        .strokeColor: UIColor.black,
        .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        .strokeWidth:  Float(-3.0)
    ]
    
    
    //MARK: Set-up and Release of ViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set image view height & width based on screen size
        //self.imageViewHeightConstraint.constant = UIScreen.main.bounds.height - toolBar.intrinsicContentSize.height - navigationBar.intrinsicContentSize.height
        self.imageViewWidthConstraint.constant = UIScreen.main.bounds.width
        
        // If an image is not yet selected disable share button
        if memeImage.image == nil {
            self.shareButton.isEnabled = false
        } else {
            self.shareButton.isEnabled = true
        }
        
        // If camera is not available on device, disable the camera button
        self.cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        // Set textField defaults
        self.topText.delegate = self
        self.topText.defaultTextAttributes = memeTextAttributes
        self.topText.textAlignment = .center

        self.bottomText.delegate = self
        self.bottomText.defaultTextAttributes = memeTextAttributes
        self.bottomText.textAlignment = .center
        
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
            setImage(image: image)
            self.shareButton.isEnabled = true
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
    
    //MARK: Share Meme Control
    @IBAction func shareMeme(_ sender: Any) {
        // Capture Meme
        let bounds = CGRect(x: -self.memeImage.frame.minX,y: -self.memeImage.frame.minY,width: view.bounds.size.width,height: view.bounds.size.height)

        UIGraphicsBeginImageContext(self.memeImage.frame.size)
        view.drawHierarchy(in: bounds, afterScreenUpdates: true)
        let theMemeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Open Share Controller to share meme
        if let finalImage = theMemeImage {
            let sharingController = UIActivityViewController(activityItems: [finalImage], applicationActivities:[])
            present(sharingController, animated: true)
        } else {
            print("Error creating Meme Image!")
        }
        
    }
    
    //MARK: Resetting for new Meme
    @IBAction func resetMeme(_ sender: Any) {
        self.bottomText.text = nil
        self.topText.text = nil
        self.memeImage.image = nil
        self.shareButton.isEnabled = false
    }
    
    
    //MARK: Controlling UIImageView Sizing
    func setImage(image: UIImage) {
        self.memeImage.image = image
        let screenSize = UIScreen.main.bounds.size

        let imageAspectRatio = image.size.width / image.size.height
        let screenAspectRatio = screenSize.width / screenSize.height

        if imageAspectRatio > screenAspectRatio {
            self.imageViewWidthConstraint.constant = min(image.size.width, screenSize.width)
            self.imageViewHeightConstraint.constant = self.imageViewWidthConstraint.constant / imageAspectRatio
        }
        else {
            self.imageViewHeightConstraint.constant = min(image.size.height, screenSize.height)
            self.imageViewWidthConstraint.constant = self.imageViewHeightConstraint.constant * imageAspectRatio
        }
        view.layoutIfNeeded()
    }
}

