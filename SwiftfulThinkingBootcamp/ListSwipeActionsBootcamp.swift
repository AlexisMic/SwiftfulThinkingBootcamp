//
//  ListSwipeActionsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 01/07/2023.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
    
    private var fruits = ["apple", "banana", "orange", "peach"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Text("Save")
                                .foregroundColor(.black)
                        }
                        .tint(.orange)
                        Button("Archive") {
                            
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Bla") {
                            
                        }
                        .tint(.red)
                    }
            }
        }
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}
