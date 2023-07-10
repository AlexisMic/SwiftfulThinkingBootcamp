//
//  FocusStateBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 01/07/2023.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum FocusCases: Hashable {
    case focusName, focusPassword, focusButton1, focusButton2
    }
    
    @State private var userName: String = ""
//    @FocusState private var nameFocused: Bool
    @State private var userPassword: String = ""
//    @FocusState private var passwordFocused: Bool
    @FocusState private var focus: FocusCases?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Enter your name...", text: $userName)
                .focused($focus, equals: .focusName)
//                .focused($nameFocused)
                .padding(.leading)
                .font(.headline)
//                .foregroundColor(.blue)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .padding(.horizontal)
//                .onSubmit {
//                    focus = .focusPassword
//                }
            
            SecureField(text: $userPassword) {
                Text("Enter your password...")
                    .foregroundColor(.blue)
            }
            .focused($focus, equals: .focusPassword)
//            .focused($passwordFocused)
            .padding(.leading)
            .font(.headline)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.gray.brightness(0.3))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button("Focus Name") {
                focus = .focusName
//                nameFocused.toggle()
            }
            .focused($focus, equals: .focusButton1)
            .buttonStyle(.borderedProminent)
            
            Button("Focus Password") {
                focus = .focusPassword
//                passwordFocused.toggle()
            }
            .focused($focus, equals: .focusButton2)
            .buttonStyle(.borderedProminent)
        }
        .onSubmit {
            if focus == .focusName {
                focus = .focusPassword
            } else {
                focus = .focusName
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                focus = .focusName
            }
        }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
