//
//  TasksViewModel.swift
//  DragDrop
//
//  Created by Reenad gh on 27/01/1444 AH.
//

import Foundation
class TasksViewModel  : ObservableObject{
    
    
    @Published var BoardTasks : [Task]
    @Published var cuurentSelectedTask : Task?
    @Published var  SelectedTaskStatus : TaskStatus = .toDo




      init(){
        self.BoardTasks = [
            Task(title: "Product recommendations", desctrption: "focus on building a recommender system that can be used to suggest products to Client X ", status: .toDo, date: Date(), user: User(userName: "Mouhamed", userStringImg: "person-2"), hashtag: ["system", "Product" ]) ,
            
            Task(title: "Data recommendation", desctrption: "explore the data available to support the project", status: .toDo, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-4"), hashtag: [ "DATA" , "Get Ready" ,"system", "Product" ]),
            
            Task(title: "Data checking ", desctrption: "ensure that data are accessible and will perform a preliminary analysis with a view to identifying a subset of features that best-suited for cluster ", status: .toDo, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-2"), hashtag: ["DATA", "accessible" , "Get Ready" , "perform"]),
            
            
            Task(title: "Cluster analysis", desctrption: "Using the learnings from Milestone 1, we will experiment with various clustering algorithms", status: .inProgress, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-1"), hashtag: ["Study", "UI" , "Get Ready" , "Swift"]),
            
            
            Task(title: "Research", desctrption: "ensure that data are accessible and will perform a preliminary analysis with a view to identifying ", status: .toDo, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-2"), hashtag: ["Study", "UI" , "Get Ready" , "Swift" , "Research"]) ,
            
            
            Task(title: "Cluster Buliding ", desctrption: "Using the learnings from Milestone 1, we will experiment with various clustering algorithms", status: .inProgress, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-3"), hashtag: ["Study", "UI" , "Get Ready" , "Swift"]) ,
            
            
            Task(title: "Improving", desctrption: "Using the learnings from Milestone 1, we will experiment with various clustering algorithms", status: .done, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-3"), hashtag: ["UX", "UI" , "Get Ready" , "Swift"])
            
            
        ]
    }
    
    
    func countTasksinStatus (status : TaskStatus) -> Int {
        switch status {
        case  .toDo :
        return BoardTasks.filter{ $0.status == .toDo }.count
        case .inProgress :
        return BoardTasks.filter{ $0.status == .inProgress }.count
        case .done :
        return BoardTasks.filter{ $0.status == .done }.count
            
        }
        
    }
    

}
