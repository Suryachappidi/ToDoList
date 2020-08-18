//
//  NeumorphicProgressbar.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct NeumorphicProgressbar: View {
    @Binding var value: Float
    
    var body: some View{
        GeometryReader{ geo in
            ZStack(alignment: .leading){
                Rectangle().frame(width: geo.size.width,height: geo.size.height)
                    .opacity(0.2)
            
            
            Capsule().frame(width: self.getProgressWidth(geo: geo),height: geo.size.height - 2)
                .foregroundColor(.bluish)
                .blendMode(.hardLight)
                .neumorphicConcaveEffect(cornerRadius: 20)
                .animation(.spring())
            }.cornerRadius(45)
        }
    }
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat{
        return min(CGFloat(self.value) * geo.size.width,geo.size.width)
    }
}
