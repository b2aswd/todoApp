//
//  CustomError.swift
//  ToDoApp
//
//  Created by Roman Manďák on 05.10.2021.
//

import Foundation

enum CustomError: Error {
    case invalidUrl
    case serverError
    case custom(description: String)
}
