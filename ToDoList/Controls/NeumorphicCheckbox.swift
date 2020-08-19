//
//  NeumorphicCheckbox.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct NeumorphicCheckbox: View {
    @State var isChecked:Bool
    var text: String
    var completion: (Bool) -> Void
    
    init(isChecked: Bool, text: String , completion: @escaping (Bool) -> Void){
        self._isChecked = State(initialValue: isChecked)
        self.text = text
        self.completion = completion
    }
    
    var body: some View {
        
            Button(action: {
                self.isChecked.toggle()
                self.completion(self.isChecked)
            }){
               HStack {
                Image(systemName: isChecked ? "checkmark":"minus")
                Text(self.text)
                Spacer()
            }
               .foregroundColor(Color.darkBluish)
            .padding()
               .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 10)
                
        }
    }
}
