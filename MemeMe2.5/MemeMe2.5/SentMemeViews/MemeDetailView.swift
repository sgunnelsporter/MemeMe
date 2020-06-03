//
//  MemeDetailView.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct MemeDetailView: View {
    
    //MARK: Properties
    var memedImage: Image = Image(systemName: "questionmark")
    
    var body: some View {
        self.memedImage
            .resizable()
            .scaledToFit()
    }
}

struct MemeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemeDetailView(memedImage: Image(systemName: "questionmark.circle"))
    }
}
