//
//  AddNewToDoView.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct AddNewToDoView: View {
    @Binding var addSheetPresented: Bool
    @State private var taskText: String = ""
    
    var body: some View {
        ZStack {
            Color.bluish
            
            VStack(spacing:20){
                Text("Add new todo")
                    .font(.title)
                .bold()
                    .gradientText(colors: [Color.bluish,Color.darkBluish], startPoint: .top, endPoint: .bottom)
                
                Image("todo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300,height: 300)
                    
                
                TextField("Enter ToDo", text: $taskText)
                .padding()
                    .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
                
                HStack{
                    //cancel Button
                    Button(action:{
                        self.addSheetPresented.toggle()
                    }){
                        HStack{
                            Image(systemName: "xmark")
                            Text("Close")
                        }
                        .foregroundColor(.white)
                    }.buttonStyle(DarkCapsuleButtonStyle(colors: [Color.red,Color.pink], startPoint: .leading, endPoint: .trailing, padding: 20))
                    
                    //Save Button
                    
                    Button(action:{
                        let vm = AddNewToDoViewModel()
                        vm.saveToDo(todoVM: ToDoViewModel(id: UUID(), text: self.taskText, completed: false))
                        self.addSheetPresented.toggle()
                    }){
                        HStack{
                            Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                            Text("Save")
                        }
                        .foregroundColor(.white)
                    }.buttonStyle(DarkCapsuleButtonStyle(colors: [Color.darkBluish,Color.darkBluish], startPoint: .leading, endPoint: .trailing, padding: 20))
                }//hstack
                
                Spacer()
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
}


