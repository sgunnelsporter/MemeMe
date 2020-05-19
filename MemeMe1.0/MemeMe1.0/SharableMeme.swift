//
//  SharableMeme.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/19/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit

class SharableMeme: UIView {
    
    
    func makeSharableMeme(topText: UITextField, bottomText: UITextField, image: UIImage) -> UIImage? {
        
        self.frame = CGRect(origin: CGPoint(x: 0,y: 0), size: image.size)
        
        let backgroundImage = UIImageView(image: image)
        backgroundImage.frame = self.bounds
        self.addSubview(backgroundImage)
        
        let topLabel = UILabel()
        topLabel.frame = CGRect(x: self.bounds.maxX, y: self.bounds.maxY, width: self.frame.width, height: self.frame.height)
        topLabel.attributedText = topText.attributedText
        self.addSubview(topLabel)
        
        let bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: 0, y: 20, width: self.frame.width, height: self.frame.height)
        bottomLabel.attributedText = bottomText.attributedText
        self.addSubview(bottomLabel)

        
        UIGraphicsBeginImageContext(self.bounds.size)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let theMemeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return theMemeImage
    }
    
}
