//
//  TodoManager.swift
//  Todo
//
//  Created by gigas on 2021/03/09.
//

import Foundation

class TodoManager {
    
    static let shared = TodoManager()
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        //TODO: create로직 추가
        
        let nextId = TodoManager.lastId+1
        TodoManager.lastId = nextId
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        //TODO: add로직 추가
        
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
        //TODO: delete 로직 추가
        
        // 1
//        todos = todos.filter { existingTodo in
//            existingTodo.id != todo.id
//        }
        
        // 2
        if let index = todos.firstIndex(of: todo) {
            todos.remove(at: index)
        }
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
        //TODO: update 로직 추가
        guard let index = todos.firstIndex(of: todo) else { return }
        
        todos[index].update(isDone: todo.isDone,
                            detail: todo.detail,
                            isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}
