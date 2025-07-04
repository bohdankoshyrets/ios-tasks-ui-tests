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

    func test_canOpenSubtasksScreen() throws {
        TasksRobot(app: app)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertSubtasksScreen()
            .assertANumberOfTasks(Constants.numberOfSubtasks)
    }
    
    func test_subtasksCompleteWhenParentTaskCompletes() throws {
        TasksRobot(app: app)
            .assertTasksScreen()
            .toggleTask(withTitle: taskTitle)
            .assertTaskIs(.completed, withTitle: taskTitle)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertSubtasksScreen()
            .assertAllTasksAre(.completed)
    }
    
    func test_completingAllSubtasksCompletesParentTask() throws {
        TasksRobot(app: app)
            .assertTaskIs(.notCompleted, withTitle: taskTitle)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .tapCompleteAllTasksButton()
            .goBack()
        
        TasksRobot(app: app)
            .assertTaskIs(.completed, withTitle: taskTitle)
    }
    
    func test_cancelAllButtonAppearsAfterCompleteAll() throws {
        TasksRobot(app: app)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .tapCompleteAllTasksButton()
            .assertAllTasksAre(.completed)
            .tapCancelAllTasksButton()
            .assertAllTasksAre(.notCompleted)
    }
     
    func test_subtaskStatusPersistsWhenSubtaskScreenIsReopened() throws {
        TasksRobot(app: app)
            .tapMoreInfoButton(forTask: taskTitle)
        
        SubtasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .toggleTask(atIndex: 0)
            .toggleTask(atIndex: 1)
            .assertTaskIs(.completed, atIndex: 0)
            .assertTaskIs(.completed, atIndex: 1)
            .goBack()
        
        TasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .tapMoreInfoButton(forTask: taskTitle)

        SubtasksRobot(app: app)
            .assertTaskIs(.completed, atIndex: 0)
            .assertTaskIs(.completed, atIndex: 1)
    }

}
