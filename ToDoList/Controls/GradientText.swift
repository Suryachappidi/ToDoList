//
//  GradientText.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI


struct GradientText: ViewModifier{
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    
    func body(content: Content) -> some View{
        content
        .overlay(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
        )
        .mask(content)
    }
}

extension View{
    func gradientText(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View{
        self.modifier(GradientText(colors: colors , startPoint: startPoint, endPoint: endPoint))
    }
}
