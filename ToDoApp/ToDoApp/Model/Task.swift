//
//  Task.swift
//  ToDoApp
//
//  Created by Roman Manďák on 28.09.2021.
//

import Foundation

public struct Task: Codable, Hashable {
    public var id: Int?
    public var userId: Int
    public var title: String
    public var date: Date
    public var category: String
    public var description: String? = nil
    public var isCompleted: Bool = false
}
