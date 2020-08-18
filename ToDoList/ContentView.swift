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
            
            RoundedRectangle(cornerRadius: 20)
            .fill(Color.bluish)
            .frame(width: 200, height: 200)
            .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
        
            
            VStack(spacing: 30) {
                Text("Hello Surya")
                    .font(.largeTitle)
                .bold()
                    .gradientText(colors: [Color.darkBluish, Color.blue], startPoint: .bottom, endPoint: .top)
                
                NeumorphicProgressbar(value: $value)
                    .frame(height:20)
                    .padding()
                
            
            
                Button("My Button"){self.value += 0.1}
                .foregroundColor(.white)
                .buttonStyle(DarkCapsuleButtonStyle(colors: [Color.bluish,Color.darkBluish], startPoint: .topLeading, endPoint: .bottomTrailing, padding: 20))
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
