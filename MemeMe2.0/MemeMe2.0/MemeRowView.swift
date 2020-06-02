//
//  MemeRowView.swift
//  MemeMe2.0
//
//  Created by Sarah Gunnels Porter on 6/1/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import Foundation
import SwiftUI

struct MemeRowView: View {
    
    var body: some View {
        Text("Testing")
    }
}
struct MemeRowView_Previews: PreviewProvider {
    static var previews: some View {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            return MemeRowView().environment(\.managedObjectContext, context)
        }
}
