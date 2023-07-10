//
//  BadgeBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 01/07/2023.
//

import SwiftUI

struct BadgeBootcamp: View {
    
    @State private var count = -1
    
    var body: some View {
        
        
        
        TabView {
            List {
                Text("apple")
                    .badge(count)
                Text("apple")
                    .badge("NEW")
                Text("apple")
                Text("apple")
            }
                .tabItem {
                    Image(systemName: "heart")
                    Text("heart")
                }
//                .onAppear {
//                    count += 1
//                }
                .badge(count)
                
            Color.blue
                .tabItem {
                    Image(systemName: "house")
                    Text("house")
                }
                .badge("NEW")
            Color.green
                .tabItem {
                    Image(systemName: "square")
                    Text("square")
                }
        }
    }
}

struct BadgeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBootcamp()
    }
}
