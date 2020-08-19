//
//  HomeScreen.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel = ToDoListViewModel()
    
    @State private var  addNewSheet: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Color.bluish
                
            
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    HStack{
                        Text("Task Manager")
                            .font(.largeTitle)
                        .bold()
                            .gradientText(colors: [Color.blue,Color.darkBluish], startPoint: .top, endPoint: .bottom)
                        
                        Spacer()
                        
                        Button(action: {
                            self.viewModel.removeCompleted()
                        }){
                            Image(systemName: "trash.fill")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(DarkCircleButtonStyle(colors: [Color.pink,Color.red], startPoint: .leading, endPoint: .trailing, padding: 20))
                    }
                    
                        // progress text
                        
                    Text(viewModel.progressDisplayValue)
                        .font(.largeTitle)
                    .bold()
                        .gradientText(colors: [Color.darkBluish,Color.blue], startPoint: .top, endPoint: .bottom)
                }
                  .padding(.top,50)
                  
                    
                        // progress bar
            
                        
                    NeumorphicProgressbar(value: $viewModel.progressValue)
                        .frame(height:20)
                        .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
                        
                        
                    // list
                    List{
                        ForEach(viewModel.todos){ todo in
                            HStack{
                                //Check Box
                                NeumorphicCheckbox(isChecked: todo.completed, text: todo.text) { checked in
                                    todo.completed = checked
                                    self.viewModel.toggleComplete(todo: todo)
                                }
                            }//hstack ends
                        }
                    }.padding(.top,40)
                }// vstack ending
            
            
            .padding()
            
            Button(action:{
                self.addNewSheet.toggle()
            }){
                Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .buttonStyle(DarkCircleButtonStyle(colors: [Color.darkBluish,Color.blue], startPoint: .leading, endPoint: .trailing, padding: 30))
            .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 60)
            .padding(.bottom,40)
            .padding(.trailing)
            
            .sheet(isPresented: $addNewSheet){
                AddNewToDoView(addSheetPresented: self.$addNewSheet).onDisappear{
                    self.viewModel.fetchAll()
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
