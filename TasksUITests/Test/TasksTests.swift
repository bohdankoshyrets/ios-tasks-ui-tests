//
//  TasksTests.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class TasksTests: BaseTest {
    override func setUp() {
        super.setUp()
        
        LoginRobot(app: app)
            .launchApp()
            .logInIfLoggedOut()
        
        TasksRobot(app: app)
            .assertTasksScreen()
    }
    
    func test_allTasksAreIncompleteAfterLogin() throws {
        TasksRobot(app: app)
            .assertANumberOfTasks(Constants.numberOfTasks)
            .assertAllTasksAre(.notCompleted)
            .tapCompleteAllTasksButton()
            .assertCancelAllTasksButtonExists()
            .assertAllTasksAre(.completed)
    }
    
    func test_allButtonsArePresentAfterLogin() throws {
        TasksRobot(app: app)
            .assertTasksScreen()
    }
    
    func test_taskChangesItsStatusWhenTapped() throws {
        let index = 0
        TasksRobot(app: app)
            .assertTaskIs(.notCompleted, atIndex: index)
            .toggleTask(atIndex: index)
            .assertTaskIs(.completed, atIndex: index)
            .toggleTask(atIndex: index)
            .assertTaskIs(.notCompleted, atIndex: index)
    }
    
    func test_logOutShowsAlertThenLoginScreenAppears() throws {
        TasksRobot(app: app)
            .tapLogoutButton()
            .assertAlertAppeared(withTitle: nil, text: "Do you really want to logout?")
            .confirmLogout()
        
        LoginRobot(app: app)
            .assertLoginScreen()
    }
    
    func test_completeAllButtonCompletesAllTasks() throws {
        TasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .tapCompleteAllTasksButton()
            .assertAllTasksAre(.completed)
    }
    
    func test_sortByNameSortsTasksCorrectly() throws {
        TasksRobot(app: app)
            .tapSortByNameButton()
            .assertTasksAreSortedByName()
    }
    
    func test_cancelAllButtonAppearsAfterCompleteAll() throws {
        TasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .tapCompleteAllTasksButton()
            .assertAllTasksAre(.completed)
            .tapCancelAllTasksButton()
            .assertAllTasksAre(.notCompleted)
    }
    
    func test_tasksPersistAfterNavigatingToSubtasksScreen() throws {
        TasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .toggleTask(withTitle: Constants.Tasks.task1)
            .toggleTask(withTitle: Constants.Tasks.task2)
            .toggleTask(withTitle: Constants.Tasks.task3)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task1)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task2)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task3)
            .assertTaskIs(.notCompleted, withTitle: Constants.Tasks.task4)
            .assertTaskIs(.notCompleted, withTitle: Constants.Tasks.task5)
            .tapMoreInfoButton(forTask: Constants.taskWithSubtasks)
        
        SubtasksRobot(app: app)
            .assertAllTasksAre(.notCompleted)
            .goBack()
        
        TasksRobot(app: app)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task1)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task2)
            .assertTaskIs(.completed, withTitle: Constants.Tasks.task3)
            .assertTaskIs(.notCompleted, withTitle: Constants.Tasks.task4)
            .assertTaskIs(.notCompleted, withTitle: Constants.Tasks.task5)
    }
}
    
    
