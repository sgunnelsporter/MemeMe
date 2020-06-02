//
//  ContentView.swift
//  MemeMe2.0
//
//  Created by Sarah Gunnels Porter on 6/1/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                }
                .tag(0)
            SentMemesListController().environment(\.managedObjectContext, managedObjectContext)
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
