//
//  DateExtention.swift
//  tasksBoard
//
//  Created by Reenad gh on 27/01/1444 AH.
//

import Foundation
//
//  DateExt.swift
//
//  Created by Tariq Almazyad on 8/10/22.
//

import Foundation


extension Date {
    /// To convert a date to specific type
    func convertDate(formattedString: DateFormattedType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formattedString.rawValue
        return formatter.string(from: self)
    }
   
}

enum DateFormattedType: String, CaseIterable {
    /// Date sample  Sunday, Sep 6, 2020
    case formattedType1 = "EEEE, MMM d, yyyy"
    /// Date sample  09/24/2020
    case formattedType2 = "MM/dd/yyyy"
    /// Date sample  09-06-2020 02:45 AM
    case formattedType3 = "MM-dd-yyyy h:mm a"
    /// Date sample  Sep 6, 2:45 AM
    case formattedType4 = "MMM d, h:mm a"
    /// Date sample  02:45:07.397
    case formattedType5 = "HH:mm:ss.SSS"
    /// Date sample  02:45:07.397
    case formattedType6 = "dd.MM.yy"
    /// Date sample  Sep 6, 2020
    case formattedType7 = "MMM d, yyyy"
    /// Time sample  24/05/2020 ● 9:24:22 PM
    case formattedType8 = "dd/MM/yyyy • h:mm:ss a"
    /// Time sample  Fri23/Oct/2020
    case formattedType9 = "E d/MMM/yyy"
    /// Thu, 22 Oct 2020 5:56:22 pm
    case formattedType10 = "E, d MMM yyyy h:mm:ss a"
    /// Date sample for Month only JUNE
    case formattedType11 = "MMMM"
    /// Date sample for Day in Number only 04
    case formattedType12 = "dd"
    /// to get seconds only
    case formattedType13 = "ss"
    /// time only 9:24:22 PM
    case timeOnly = "h:mm a"
    /// Date sample Monday
    case dateDayOnly = "EEEE"
}

