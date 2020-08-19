//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by Surya Chappidi on 19/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

class CoreDataManager{
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    //get records
    
    func getToDos() -> [ToDo] {
            var todos = [ToDo]()
        let todoRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        
        do{
            todos = try self.managedContext.fetch(todoRequest)
        }
        catch{
            print(error)
        }
        
        return todos
    }
    
    // save ToDo
    
    func saveToDo(id: UUID,text: String, completed: Bool) {
        let todo = ToDo(context: self.managedContext)
        todo.text = text
        todo.id = id
        todo.completed = completed
        
        do{
            try self.managedContext.save()
        }
        catch{
            print(error)
        }
    }
    
    // remove ToDo
    
    func removeToDo(){
        let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "completed == YES")
        
        do{
            let todos = try self.managedContext.fetch(fetchRequest)
            for todo in todos{
                self.managedContext.delete(todo)
            }
            try self.managedContext.save()
        }
        catch{
            print(error)
        }
    }
    
    // update ToDo
    
    func updateToDo(id: UUID,text: String, completed: Bool){
        let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@",id.uuidString)
        
        do{
            let todo = try self.managedContext.fetch(fetchRequest).first
            todo?.completed = completed
            todo?.text = text
            
            try self.managedContext.save()
        }
        catch{
            print(error)
        }
    }
    
}
