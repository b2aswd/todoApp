//
//  MockTaskDataSource.swift
//  ToDoApp
//
//  Created by Roman Manďák on 28.09.2021.
//

import Foundation

public class MockTaskRepository: TaskRepository {

    private var tasks: [Task] = []
    private let taskCount = 5

    public init() {
        for index in 0...taskCount {
            tasks.append(Task(id: index, title: "Úkol \(index)",
                              date: Date(), category: "Mock", description: "Popis úkol \(index)", isCompleted: index%2 == 0))
        }
    }

    func getTasks() -> [Task] {
        return tasks
    }

    func getTask(id: Int) -> Task? {
        return tasks.first(where: {$0.id == id})
    }

    func addTask(task: Task) -> Task? {
        self.tasks.append(task)
        return task
    }

    func updateTask(task: Task) -> Task? {
        return task
    }

}
