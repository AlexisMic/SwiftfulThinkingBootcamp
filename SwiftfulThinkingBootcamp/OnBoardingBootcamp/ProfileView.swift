//
//  ProfileView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 6/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var isSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.purple)
                .background(.white)
            
            Text("\(currentUserName ?? "Unknow")")
            Text("You have \(currentUserAge ?? 0) years old.")
            Text("Your gender is \(currentUserGender ?? "Unknow")")
           
            Text("Sign out")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    currentUserName = nil
                    currentUserAge = nil
                    currentUserGender = nil
                    withAnimation(.spring()) {
                        isSignedIn.toggle()
                    }
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 40)
        .background(.white)
        .cornerRadius(10)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(.blue)
    }
}
