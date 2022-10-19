//
//  ApiTaskRepository.swift
//  ToDoApp
//
//  Created by Roman Manďák on 05.10.2021.
//

import Foundation

public class ApiTaskRepository: TaskRepository {

    private var tasks: [Task] = []
    private let baseUrl: String = "https://utb-todo-backend.docker.b2a.cz"
    public static var userId: Int = 2

    private var listUrl: String {
        return "\(baseUrl)/user/\(Self.userId)/todo"
    }

    private func taskUrl(id: Int) -> String {
        return "\(baseUrl)/todo/\(id)"
    }

    private var createUrl: String {
        return "\(baseUrl)/user/\(Self.userId)/todo"
    }

    public init() {}

    func getTasks(completionHandler: @escaping (Result<[Task], Error>) -> Void) {
        guard let url = URL(string: listUrl) else {
            completionHandler(.failure(CustomError.invalidUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil, let data = data else {
                completionHandler(.failure(error ?? CustomError.serverError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(CustomError.custom(description: response?.description ?? "")))
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Date.defatultFormatter)
            if let taskArray = try? decoder.decode([Task].self, from: data) {
                completionHandler(.success(taskArray))
            } else {
                completionHandler(.failure(CustomError.serverError))
            }
        })
        task.resume()
    }

    func getTask(id: Int) -> Task? {
        //TODO - find correct Task
        return tasks.first
    }

    func addTask(task: Task) -> Task? {
        self.tasks.append(task)
        // TODO - async action
        return task
    }

    func updateTask(task: Task, completionHandler: @escaping (Result<Task, Error>) -> Void) {
        guard let taskId = task.id, let url = URL(string: taskUrl(id: taskId)) else {
            completionHandler(.failure(CustomError.invalidUrl))
            return
        }

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(Date.defatultFormatter)
        guard let jsonData = try? encoder.encode(task) else {
            completionHandler(.failure(CustomError.custom(description: "Error: Trying to convert model to JSON data")))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            guard error == nil, let data = data else {
                completionHandler(.failure(error ?? CustomError.serverError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(CustomError.custom(description: response?.description ?? "")))
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Date.defatultFormatter)
            if let taskData = try? decoder.decode(Task.self, from: data) {
                completionHandler(.success(taskData))
            } else {
                completionHandler(.failure(CustomError.serverError))
            }
        })
        task.resume()
    }
}
