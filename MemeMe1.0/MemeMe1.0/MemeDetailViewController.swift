//
//  MemeDetailViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/28/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    //MARK: Properties
    var meme: Meme!
    
    //MARK: Outlets
    @IBOutlet weak var memeImageView: UIImageView!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.memeImageView.image = self.meme.memedImage
    }
    
}
