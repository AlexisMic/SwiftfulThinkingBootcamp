//
//  AnimationUpdatedBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 04/07/2023.
//

import SwiftUI

struct AnimationUpdatedBootcamp: View {
    
    @State private var animation1 = false
    @State private var animation2 = false

    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Button("animation 1") {
                    animation1.toggle()
                }
                .buttonStyle(.borderedProminent)
                Button("animation 2") {
                    animation2.toggle()
                }
                .buttonStyle(.borderedProminent)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animation1 ? .leading : .trailing)
                        .background(.yellow)
                        .frame(maxHeight: .infinity, alignment: animation2 ? .bottom : .top)
                        .background(.green)
                }
            }
            .padding(.vertical,60)
        }
        .animation(.spring(), value: animation1)
        .animation(.spring(), value: animation2)
        .ignoresSafeArea()

        
    }
}

struct AnimationUpdatedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationUpdatedBootcamp()
    }
}
