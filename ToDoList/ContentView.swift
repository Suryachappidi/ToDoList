//
//  ContentView.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 0.0
    @State private var isChecked: Bool = false
    var body: some View {
        ZStack{
            Color.bluish
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
