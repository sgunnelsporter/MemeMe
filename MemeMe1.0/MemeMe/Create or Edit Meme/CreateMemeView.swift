//
//  CreateMemeView.swift
//  MemeMe2.0
//
//  Created by Sarah Gunnels Porter on 6/1/20.
//  Copyright © 2020 Gunnels Porter. All rights reserved.
//

import Foundation
import SwiftUI

struct CreateMemeView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIView(context: UIViewControllerRepresentableContext<CreateMemeView>) -> CreateMemeViewController {
        return CreateMemeViewController()
    }

    func updateUIView(_ uiView: CreateMemeViewController, context: UIViewControllerRepresentableContext<CreateMemeView>) {
        uiView.viewWillAppear(true)
    }
}
