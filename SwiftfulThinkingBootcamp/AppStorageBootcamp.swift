//
//  AppStorageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 6/27/23.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    //@State var currentName: String?
    
    @AppStorage("name") var currentName: String?
    
    var body: some View {

        VStack(spacing: 20) {
            
            if let name = currentName {
                Text(name)
            } else {
                Text("Insert your name")
            }
            
            Button("Save") {
                let name = "Henrique"
                currentName = name
//                UserDefaults.standard.set(currentName, forKey: "name")
            }
        }
//        .onAppear {
//            currentName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
