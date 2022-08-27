//
//  TaskCard.swift
//  tasksBoard
//
//  Created by Reenad gh on 27/01/1444 AH.
//

import SwiftUI

struct TaskCardView: View {
    @Binding var task : Task

    var body: some View {
        VStack{
            VStack (alignment: .leading , spacing: 10){
            HStack{
                Text(task.date.convertDate(formattedString: .formattedType4))
               .font(.system(size: 12))
                Spacer()
      
            }.padding(.vertical , 10)
                Text(task.title)
                    .font(.system(size: 15))
                    .fontWeight(.heavy)
                Text(task.desctrption)
                    .font(.system(size: 12))
                Divider()
                    .padding(.vertical , 5)
                HStack {
                    ForEach(task.hashtag , id : \.self){  hashtag in
                        Text(hashtag)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(4)
                            .background(task.status.color)
                            .cornerRadius(8)
                    }
                }

            Spacer()
            }.padding()
            
        }
        .overlay(
            Image(task.user.userStringImg)
                .resizable()
                .scaledToFit()
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .padding()
            ,alignment : .topTrailing
        )
        .frame(width: UIScreen.main.bounds.width - 120)
        .frame( height: 180 )
        .background(Color(.white))
        .cornerRadius(0)
        
  
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(task: .constant(task1Example))
            .padding()
            .previewLayout(.sizeThatFits)
            .background(Color("Color-Blue"))
    }
}
