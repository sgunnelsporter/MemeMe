//
//  MemeDetailView.swift
//  MemeMe1.0
//
//  Created by Sarah Gunnels Porter on 5/28/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import UIKit
import SwiftUI

struct MemeDetailView: View {
    
    //MARK: Properties
    var memedImage: UIImage?
    
    var body: some View {
        Image(uiImage: self.memedImage ?? UIImage(systemName: "questionmark.square")!)
        }
}
