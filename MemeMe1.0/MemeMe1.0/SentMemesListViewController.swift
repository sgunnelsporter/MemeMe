//
//  SharedMemesListViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class SentMemesListViewController: UITableViewController {

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
