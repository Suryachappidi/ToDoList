//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation
import SwiftUI

class ToDoListViewModel: ObservableObject{
    
    @Published var todos: [ToDoViewModel]
    @Published var progressValue: Float = 0.0
    
    var progressDisplayValue: String{
        return progressValue > 0.0 ? "\(Int(progressValue * 100))%" : "0%"
    }
    
    init() {
        self.todos = CoreDataManager.shared.getToDos().map(ToDoViewModel.init)
    }
    
    func fetchAll() {
        self.todos = CoreDataManager.shared.getToDos().map(ToDoViewModel.init)
        var completed = 0
        for todo in self.todos {
            if todo.completed == true{
                completed += 1
            }
        }
        if todos.count > 0{
            progressValue = Float(completed) / Float(self.todos.count)
        }
        else{
            progressValue = 0.0
        }
    }
    
    func removeCompleted(){
        todos.removeAll{ todo in
            todo.completed == true
        }
        
        CoreDataManager.shared.removeToDo()
        fetchAll()
    }
    
    func toggleComplete(todo: ToDoViewModel) {
        CoreDataManager.shared.updateToDo(id: todo.id, text: todo.text, completed: todo.completed)
        fetchAll()
    }
    
}
