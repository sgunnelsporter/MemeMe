//
//  SentMemesCollectionView.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct SentMemesCollectionView: View {
    //MARK: Load Memes
    @Environment(\.managedObjectContext)
    var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Meme.dateCreated, ascending: true)],
        animation: .default)
    var memes: FetchedResults<Meme>
    
    //MARK: State Control
    @State var createNewMeme : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.memes, id: \.self) { m in
                        NavigationLink(
                         destination: MemeDetailView(memedImage: Image(uiImage: (UIImage(data: m.memedImage!) ?? UIImage(systemName: "questionmark"))!))
                        ) {
                            Image(uiImage: UIImage(data: m.memedImage!)!)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3, antialiased: false)
                            .frame(width: 120, height: 120)
                         }
                    }
                }
            }
            .navigationBarTitle(Text("Sent Memes"), displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(
                    action: {
                        withAnimation {
                            self.createNewMeme.toggle()
                        }
                        
                    }
                ) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct SentMemesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SentMemesCollectionView()
    }
}
