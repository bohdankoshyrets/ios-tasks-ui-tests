//
//  Constants.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

enum Constants {
    enum ValidCreds {
        static let username = "test@example.com"
        static let password = "test"
    }
    
    enum InvalidCreds {
        static let username = "test"
        static let password = "invalid"
    }
    
    enum Tasks {
        static let task1 = "Buy milk"
        static let task2 = "Pay rent"
        static let task3 = "Change tires"
        static let task4 = "Sleep"
        static let task5 = "Dance"
    }
    
    static let numberOfTasks = 5
    static let numberOfSubtasks = 4
    static let taskWithSubtasks = "Sleep"
}
