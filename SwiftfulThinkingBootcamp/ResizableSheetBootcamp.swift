//
//  ResizableSheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 03/07/2023.
//

import SwiftUI

struct ResizableSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        Text("Click me")
            .onTapGesture {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                NextView()
                    .presentationDetents([.medium, .large, .fraction(100)])
            }
            
    }
}

struct ResizableSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetBootcamp()
    }
}

struct NextView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            Text("Next View")
        }
    }
}
