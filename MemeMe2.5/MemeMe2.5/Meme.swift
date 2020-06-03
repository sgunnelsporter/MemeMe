//
//  Meme.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

extension Meme: Identifiable {
    //MARK: Create Meme
    static func create(in managedObjectContext: NSManagedObjectContext, topText: NSAttributedString, bottomText: NSAttributedString, originalImage: UIImage, memedImage: UIImage){
    
    let newMeme = self.init(context: managedObjectContext)
        
        newMeme.memeID = UUID()
        newMeme.dateCreated = Date()
        newMeme.topText = topText.string
        newMeme.bottomText = bottomText.string
        newMeme.originalImage = originalImage.pngData()
        newMeme.memedImage = memedImage.pngData()
        
        do {
            try  managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    //MARK: Create Test Data
    static func createTestMemes(in managedObjectContext: NSManagedObjectContext) {
        let TopTextKey = "TopTextKey"
        let BottomTextKey = "BottomTextKey"
        let OriginalImageNameKey = "OriginalImageNameKey"
        let MemedImageNameKey = "MemedImageNameKey"
        let memeDictionarySet = [
            [TopTextKey : "1Top Text", BottomTextKey : "Bottom Text", MemedImageNameKey : "pic1", OriginalImageNameKey : "pic1"],
            [TopTextKey : "2Top Text", BottomTextKey : "Bottom Text", MemedImageNameKey : "pic2", OriginalImageNameKey : "pic2"],
            [TopTextKey : "3Top Text", BottomTextKey : "Bottom Text", MemedImageNameKey : "pic3", OriginalImageNameKey : "pic3"],
            [TopTextKey : "4Top Text", BottomTextKey : "Bottom Text", MemedImageNameKey : "pic4", OriginalImageNameKey : "pic4"],
        ]
        
        for m in memeDictionarySet {
            Meme.create(in: managedObjectContext, topText: NSAttributedString(string: m[TopTextKey]!),bottomText: NSAttributedString(string: m[BottomTextKey]!), originalImage: UIImage(named: m[OriginalImageNameKey]!)!, memedImage: UIImage(named: m[MemedImageNameKey]!)!)
        }
        do {
            try managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

extension Collection where Element == Meme, Index == Int {
    func delete(at indices: IndexSet, from managedObjectContext: NSManagedObjectContext) {
        indices.forEach { managedObjectContext.delete(self[$0]) }
 
        do {
            try managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

