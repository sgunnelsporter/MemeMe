//
//  SentMemesListView.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct SentMemesListView: View {
    //MARK: Load Memes
    @Environment(\.managedObjectContext)
    var viewContext
    @FetchRequest(
        entity: Meme.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Meme.dateCreated, ascending: true)]
    ) var memes: FetchedResults<Meme>
    
    //MARK: State Control
    @State var createNewMeme : Bool = false
    
    var body: some View {
        NavigationView {
             List {
                ForEach(self.memes, id: \.self) { m in
                   NavigationLink(
                    destination: MemeDetailView(memedImage: Image(uiImage: (UIImage(data: m.memedImage!) ?? UIImage(systemName: "questionmark"))!))
                   ) {
                    MemeRowView(meme: m)
                    }
                }.onDelete { indices in
                self.memes.delete(at: indices, from: self.viewContext)
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
                .sheet(isPresented: $createNewMeme){
                    CreateNewMemeView()
                    .onDisappear{
                        //MARK: Testing Only: Run once per device
                        //Meme.createTestMemes(in: self.viewContext)
                            // refresh the view
                            self.viewContext.refreshAllObjects()
                    }
                 }

        }
    }
}

struct SentMemesListView_Previews: PreviewProvider {
    static var previews: some View {
        SentMemesListView()
    }
}
