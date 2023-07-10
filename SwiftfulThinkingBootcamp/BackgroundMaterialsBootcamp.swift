//
//  BackgroundMaterialsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 30/06/2023.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
                Text("Hello, World!")
                    
                Text("Save")
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .onTapGesture {
                        //
                    }
                
                Button {
                    //
                } label: {
                    Text("Save")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        
                        
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                
                Button("Save") {
                    //
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            AsyncImage(url: URL(string: "https://picsum.photos/400"))
        )
    }
}

struct BackgroundMaterialsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootcamp()
    }
}
