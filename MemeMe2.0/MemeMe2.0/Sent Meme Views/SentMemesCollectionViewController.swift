//
//  SharedMemesCollectionViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit
import NotificationCenter

class SentMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
     var detailVCID : String = "MemeDetailViewController"
    var SentMemeCollectionCellID = "SentMemeCollectionCell"
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        
        let space : CGFloat = 8.0
        let wDimension = (view.frame.size.width - (2 * space)) / 3.0
        let hDimension = (view.frame.size.height - (2 * space)) / 4.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: wDimension, height: hDimension)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
        self.collectionView.reloadData()
    }
    
    func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memes = appDelegate.memes
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: detailVCID) as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.SentMemeCollectionCellID, for: indexPath) as! SentMemeCollectionCell
        let meme = self.memes[(indexPath as NSIndexPath).row]

        // Set the name and image
        cell.sentMemeImage.image = meme.memedImage

        return cell
    }
    
    @objc func memeWasShared(_ notification:Notification){
        
    }
}
