//
//  AddNewToDoViewModel.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import Foundation

class AddNewToDoViewModel {
    func saveToDo(todoVM: ToDoViewModel) {
        CoreDataManager.shared.saveToDo(id: todoVM.id, text: todoVM.text, completed: todoVM.completed)
    }
}
