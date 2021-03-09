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
        return Todo(id: 1, isDone: false, detail: "2", isToday: true)
    }
    
    func addTodo(_ todo: Todo) {
        //TODO: add로직 추가
    }
    
    func deleteTodo(_ todo: Todo) {
        //TODO: delete 로직 추가
        
    }
    
    func updateTodo(_ todo: Todo) {
        //TODO: updatee 로직 추가
        
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
