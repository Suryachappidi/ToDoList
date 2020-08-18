//
//  Extensions.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

extension Color {
    static let bluish = Color(#colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1)) 
    static let darkBluish = Color(#colorLiteral(red: 0.09803921569, green: 0.2117647059, blue: 0.262745098, alpha: 1))
}

extension LinearGradient{
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors),startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
