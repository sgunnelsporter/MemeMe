//
//  SentMemeCollectionCell.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/25/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import Foundation
import SwiftUI

struct SentMemeCollectionCell: View {
    
    var body: some View {
        Image(systemName: "questionmark")
    }
}
struct SentMemeCollectionCell_Previews: PreviewProvider {
    static var previews: some View {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            return SentMemeCollectionCell().environment(\.managedObjectContext, context)
        }
}
