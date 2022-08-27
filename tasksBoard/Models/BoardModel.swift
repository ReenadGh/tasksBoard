//
//  BoardModel.swift
//  tasksBoard
//
//  Created by Reenad gh on 27/01/1444 AH.
//

import Foundation
import SwiftUI



enum TaskStatus : CaseIterable , Hashable {
   case toDo
   case inProgress
   case done
    
 
    var title : String {
        switch  self {
        case .toDo         : return "To Do"
        case .inProgress   :return "Doing"
        case .done         :  return "Done "

        }
    }
    
    
    
    var color : Color {
        switch  self {
        case .toDo         : return Color("Color-Pink")
        case .inProgress   :return Color("Color-Blue")
        case .done         :  return Color("Color-Purple")

        }
    }
   }
   
struct Task : Hashable , Identifiable {
  
    let id = UUID().uuidString
    let title : String
    let desctrption : String
    var status : TaskStatus
    let date : Date
    let user : User
    let hashtag : [String]

}

struct User  : Hashable {
    let userName : String
    let userStringImg : String
    
}

let task1Example : Task = Task(title: "Doing HomeWork", desctrption: "yes its doning home work today hehehhe", status: .toDo, date: Date(), user: User(userName: "Reenad gh", userStringImg: "person-1"), hashtag: ["Study", "UI" , "Get Ready" , "Swift"])
