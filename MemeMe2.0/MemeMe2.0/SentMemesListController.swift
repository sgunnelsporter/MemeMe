//
//  SentMemesListController.swift
//  MemeMe2.0
//
//  Created by Sarah Gunnels Porter on 6/1/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI
import CoreData

struct SentMemesListController: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Meme.dateCreated, ascending: true)],
        animation: .default)
    var memes: FetchedResults<Meme>
    
    @State var createdNewMeme : Bool = false
 
    var body: some View {
        NavigationView {
             List {
                ForEach(self.memes, id: \.self) { thisMeme in
                   NavigationLink(
                    destination: MemeDetailView(memedImage: UIImage(data: thisMeme.memedImage!))
                   ) {
                      MemeRowView()
                    }
                }
               }
             .navigationBarTitle(Text("Sent Memes"), displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                self.createdNewMeme.toggle()
                            }
                            
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
                .sheet(isPresented: $createdNewMeme){
                    CreateMemeViewController()
                    .onDisappear{
                            // refresh the view
                            self.viewContext.refreshAllObjects()
                    }
                 }

        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct SentMemesListController_Previews: PreviewProvider {
    static var previews: some View {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            return SentMemesListController().environment(\.managedObjectContext, context)
        }
}
