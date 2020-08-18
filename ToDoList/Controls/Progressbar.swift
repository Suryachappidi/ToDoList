//
//  Progressbar.swift
//  ToDoList
//
//  Created by Surya Chappidi on 18/08/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct Progressbar: View {
    
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading){
                Rectangle().frame(width: geo.size.width,height: geo.size.height)
                    .opacity(0.3)
                .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                
                Rectangle().frame(width: self.getProgressWidth(geo: geo),height:  geo.size.height)
                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .animation(.spring())
            }
            .cornerRadius(45)
        }
    }
        
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat {
            return min(CGFloat(self.value) * geo.size.width, geo.size.width)
    }
}

struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(value: .constant(0.5))
    }
}
