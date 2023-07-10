//
//  ToolbarBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 02/07/2023.
//

import SwiftUI

struct ToolbarBootcamp: View {
    
    @State private var paths: [String] = []
    @State private var text = ""
    
    var body: some View {
        NavigationStack(path: $paths) {
            ScrollView {
                VStack {
                    TextField("Placeholder", text: $text)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 30)
                }
            }
            .navigationTitle("Toolbar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "house")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
                // retira o BarTitle quando inline
//                ToolbarItem(placement: .principal) {
//                    Image(systemName: "pencil")
//                }
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "pencil")
                }
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "pencil")
                }
                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "square")
                }
                ToolbarTitleMenu {
                    Button("Screen 1") {
                        paths.append("Screen 1")
                    }
                    Button("Screen 2") {
                        paths.append("Screen 2")
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("\(value)")
            }
        }
    }
}

struct ToolbarBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarBootcamp()
    }
}
