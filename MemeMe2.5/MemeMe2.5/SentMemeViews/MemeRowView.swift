//
//  MemeRowView.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct MemeRowView: View {
    var meme: Meme
    var defaultImage: UIImage = UIImage(systemName: "questionmark")!
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: self.meme.memedImage!)!)
                .resizable()
                .scaledToFit()
                .cornerRadius(3, antialiased: false)
                .frame(width: 80, height: 80, alignment: Alignment.leading)
            Text(self.meme.topText!)
            Text("...")
            Text(self.meme.bottomText!)
        }
    }
}

/*struct MemeRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        MemeRowView()
    }
}*/
