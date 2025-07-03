//
//  SubtasksTests.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class SubtasksTests: BaseTest {
    let taskTitle = Constants.taskWithSubtasks
    
    override func setUp() {
        super.setUp()
        
        LoginRobot(app: app)
            .launchApp()
            .logInIfLoggedOut()
        
        TasksRobot(app: app)
            .assertTasksScreen()
    }

    func test_canOpenSubtasksScreen() {
        TasksRobot(app: app)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertSubtasksScreen()
            .assertANumberOfTasks(Constants.numberOfSubtasks)
    }
    
    func test_subtasksCompleteWhenParentTaskCompletes() {
        TasksRobot(app: app)
            .assertTasksScreen()
            .toggleTask(withTitle: taskTitle)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertSubtasksScreen()
            .assertAllTasksAre(.completed)
    }
    
    func test_completingAllSubtasksCompletesParentTask() {
        TasksRobot(app: app)
            .assertTaskIs(.notCompleted, withTitle: taskTitle)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .tapCompleteAllTasksButton()
            .goBack()
        
        TasksRobot(app: app)
            .assertTaskIs(.completed, withTitle: taskTitle)
    }
}
