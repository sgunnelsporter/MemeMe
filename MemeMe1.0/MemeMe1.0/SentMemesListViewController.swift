//
//  SharedMemesListViewController.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class SentMemesListViewController: UITableViewController {

    var memes: [Meme]!
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        // Do any additional setup after loading the view.
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentMemeTableCell")
        cell?.textLabel?.text = String("\(self.memes[indexPath.row].topText) ... \(self.memes[indexPath.row].bottomText)")
        cell?.imageView?.image = self.memes[indexPath.row].memedImage
        return cell!
    }
}
