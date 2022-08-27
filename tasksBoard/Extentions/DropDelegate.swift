//
//  DropDelegate.swift
//  tasksBoard
//
//  Created by Reenad gh on 28/01/1444 AH.
//

import Foundation
import SwiftUI
struct DropViewDelegate : DropDelegate {
        var task : Task
        var tasksData : TasksViewModel
 
    func performDrop(info: DropInfo) -> Bool {
        return true 
    }
    
     func dropEntered(info: DropInfo) {
        
    

      
        
         
        let formIndex = tasksData.BoardTasks.firstIndex{ (task) -> Bool in
            return task.id == tasksData.cuurentSelectedTask?.id
        } ?? 0
        
        let toIndex = tasksData.BoardTasks.firstIndex{ (task) -> Bool in
            return task.id == self.task.id

        } ?? 0
        
 
       
        if (formIndex != toIndex){
            
            //swapping
            withAnimation{
              
            let fromTask = tasksData.BoardTasks[formIndex]
            tasksData.BoardTasks[formIndex] = tasksData.BoardTasks[toIndex]
                tasksData.BoardTasks[toIndex] = fromTask
                
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropExited(info: DropInfo) {
          print(info.location.x)

    }
    
    
}
