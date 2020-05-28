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
    var detailVCID : String = "MemeDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMemes()
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)

        self.loadMemes()
    }
    
    func loadMemes() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memes = appDelegate.memes
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: detailVCID) as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentMemeTableCell")
        cell?.textLabel?.text = String("\(self.memes[indexPath.row].topText?.string) ... \(self.memes[indexPath.row].bottomText?.string)")
        cell?.imageView?.image = self.memes[indexPath.row].memedImage
        return cell!
    }
}
