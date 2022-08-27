//
//  ToDoView.swift
//  tasksBoard
//
//  Created by Reenad gh on 27/01/1444 AH.


import SwiftUI

struct ToDoView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State var  boardOffest : CGFloat =  0
    @Namespace var animation
    @StateObject var tasksVM : TasksViewModel = TasksViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                // MARK: - Custum Board Picker
                HStack(spacing : 0){
                    
                    ForEach(TaskStatus.allCases , id: \.self) { status in
                        Button {
                            withAnimation{
                                tasksVM.SelectedTaskStatus = status
                            }
                        } label: {
                            
                            if status == tasksVM.SelectedTaskStatus {
                                HStack {
                                    Text(status.title)
                                        .font(.system(size : 15))
                                        .fontWeight(.bold)
                                   
                                    Text("\(tasksVM.countTasksinStatus(status: status))")
                                        .fontWeight(.heavy)
                                        .padding(12)
                                        .background(
                                            Color(.systemGray3).clipShape(Circle()))

                                }
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 3 + 10, height: 50)
                                 .background(
                                        status.color
                                            .cornerRadius(15)
                                            .matchedGeometryEffect(id: "tab", in: animation)
                                )
                            }else{
                                
                                HStack {
                                    Text(status.title)
                                        .fontWeight(.bold)
                                        .font(.system(size : 15))

                                    Text("\(tasksVM.countTasksinStatus(status: status))")
                                        .fontWeight(.heavy)
                                        .padding(12)
                                        .background(
                                            Color(.white).clipShape(Circle()))
                                    
                                }
                                .foregroundColor(.black)
                                .frame(width: (UIScreen.main.bounds.width / 3 ) - 20 , height: 50)
                                    .background(
                                        Color.clear
                                )
                            }
                            
                            
                            
                            
                            
                        }
                        
                    }
                }
                .onChange(of: tasksVM.SelectedTaskStatus, perform: { statusSection in
                    withAnimation{
                        
                        if (statusSection == .inProgress){
                            boardOffest = -(UIScreen.main.bounds.width - 100)
                            
                        }else if (statusSection == .done){
                            boardOffest = -(UIScreen.main.bounds.width + 70  )
                        }else {
                            boardOffest = 0
                        }
                        
                        
                        
                    }
                })
                .background(Color(.systemGray6)).cornerRadius(12)
                
                
                
                GeometryReader { proxy in
                    HStack ( spacing: 0 ){
                        
                        ForEach(TaskStatus.allCases , id: \.self) { status in
                            
                            ScrollView (.vertical , showsIndicators: false) {
                                
                                VStack (alignment: .center, spacing:5){
                                    
                                    ForEach($tasksVM.BoardTasks , id : \.self){ $task in
                                        if task.status == status {
                                            
                                            TaskCardView(task: $task)
                                                .gesture(
                                                    DragGesture()
                                                        .onEnded { value in
                                                      if value.translation.width > 0  {
                                                                if task.status == .toDo {
                                                                    withAnimation(){
                                                                task.status = .inProgress
                                                                        tasksVM.SelectedTaskStatus = .inProgress
                                                                    }
                                                                }
                                                    else if task.status == .inProgress {
                                                         withAnimation(){
                                                        task.status = .done
                                                             tasksVM.SelectedTaskStatus = .done
                                                                    }
                                                                }
                                                            }
                                                            
                                                            
                                                        }
                                                )
                                            
                                                .onDrag ({
                                                    
                                                    tasksVM.cuurentSelectedTask = task
                                                    
                                                    return NSItemProvider(contentsOf: URL(string: task.id))!
                                                    
                                                })
                                            
                                                .onDrop(of: [.url], delegate: DropViewDelegate(task: task ,tasksData: tasksVM )
                                                        
                                                )
                                            
                                            
                                        }
                                    }
                                    Spacer()
                                }.padding(.top , 10)
                                    .ignoresSafeArea()
                                    .frame(width: UIScreen.main.bounds.width - 100)
                                    .frame(minHeight : UIScreen.main.bounds.height)
                                
                            }
                            .background(status.color)
                            
                        }
                    }
                    .offset(x:boardOffest)
                
                    
                }
                
                
                
                
            }
            .navigationBarTitle("Kanban Board")
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}






