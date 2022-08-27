//
//  DisableScrollingExtetion.swift
//  tasksBoard
//
//  Created by Reenad gh on 28/01/1444 AH.
//

import Foundation
import SwiftUI

struct DisableScrolling: ViewModifier {
    var disabled: Bool
    
    func body(content: Content) -> some View {
    
        if disabled {
            content
                .simultaneousGesture(DragGesture(minimumDistance: 0))
        } else {
            content
        }
        
    }
}

extension View {
    func disableScrolling(disabled: Bool) -> some View {
        modifier(DisableScrolling(disabled: disabled))
    }
}
