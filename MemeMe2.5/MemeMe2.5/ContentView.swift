//
//  ContentView.swift
//  MemeMe2.5
//
//  Created by Sarah Gunnels Porter on 6/2/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            SentMemesCollectionView().environment(\.managedObjectContext, managedObjectContext)
                .font(.title)
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                }
                .tag(0)
            SentMemesListView().environment(\.managedObjectContext, managedObjectContext)
                .font(.title)
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
