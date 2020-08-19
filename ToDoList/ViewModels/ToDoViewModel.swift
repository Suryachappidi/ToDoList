//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation

class ToDoViewModel: Identifiable {
    var id: UUID
    var text: String
    var completed: Bool
    
    init(id:UUID,text: String,completed: Bool) {
        self.id = id
        self.text = text
        self.completed = completed
    }
    
    init(todo: ToDo) {
        self.id = todo.id!
        self.text = todo.text!
        self.completed = todo.completed
    }
}

