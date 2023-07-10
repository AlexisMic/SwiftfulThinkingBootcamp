//
//  OnSubmitTextFieldBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 02/07/2023.
//

import SwiftUI

struct OnSubmitTextFieldBootcamp: View {
    
    @State private var textFieldButton = ""
    @State private var placeholderColor: Color = .orange
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Placeholder1...", text: $textFieldButton)
                .font(.headline)
                .padding(.horizontal)
//                .textFieldStyle(.roundedBorder)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.horizontal)
                .submitLabel(.continue)
                
            
            TextField("Placeholder2...", text: $textFieldButton)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            
            TextField(text: $textFieldButton) {
                Text("Placeholder3...")
                    .foregroundColor(placeholderColor)
            }
            .padding(.horizontal)
            .onSubmit {
                placeholderColor = .red
            }

        }
    }
}

struct OnSubmitTextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmitTextFieldBootcamp()
    }
}
