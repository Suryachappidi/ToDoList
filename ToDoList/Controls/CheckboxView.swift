//
//  CheckboxView.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked:Bool
    var onTap: (_ isChecked: Bool) -> Void
    
    func toggle(){
        self.isChecked.toggle()
        self.onTap(self.isChecked)
    }
    var body: some View {
        
            Button(action: toggle) {
               HStack {
                Image(systemName: isChecked ? "checkmark.square":"square")
                .frame(width: 30, height: 30)
            }
        }
    }
}
