//
//  SharedMemesCollectionViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
   var memes: [Meme]! {
          let object = UIApplication.shared.delegate
          let appDelegate = object as! AppDelegate
          return appDelegate.memes
      }
      
    
   override func viewDidLoad() {
        super.viewDidLoad()

        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}
