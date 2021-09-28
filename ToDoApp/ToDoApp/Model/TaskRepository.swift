//
//  TasksRepository.swift
//  ToDoApp
//
//  Created by Roman Manďák on 28.09.2021.
//

import Foundation

protocol TaskRepository {
    func getTasks() -> [Task]
    func getTask(id: Int) -> Task?
    func addTask(task: Task) -> Task?
    func updateTask(task: Task) -> Task?
}
