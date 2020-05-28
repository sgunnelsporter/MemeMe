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
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentMemeTableCell")
        cell?.textLabel?.text = String("\(self.memes[indexPath.row].topText) ... \(self.memes[indexPath.row].bottomText)")
        cell?.imageView?.image = self.memes[indexPath.row].memedImage
        return cell!
    }
}
