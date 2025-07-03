//
//  WaitState.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

enum WaitState {
    case existence
    case disappearance
    
    var predicateFormat: String {
        switch self {
        case .existence:
            return "exists == true"
        case .disappearance:
            return "exists == false"
        }
    }
}
