//
//  OnBoardingView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 6/28/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    // Onboarding States:
    /*
     0 - Welcome screen
     1 - Enter name
     2 - Enter age
     3 - Enter gender
     */
    @State var onboardingState: Int = 0
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    @State var buttonText: String = "Sign Up"
    private var transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    @State private var showAlert = false
    @State private var alertMsg = ""
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var isSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)

                case 3:
                    addGenderSection                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }

            // buttons
            VStack {
                Spacer()
                if onboardingState < 4 {
                    buttonsView
                }
                
            }
            .padding(30)
        }
        .alert(Text("Alert"), isPresented: $showAlert) {
            //
        } message: {
            Text(alertMsg)
        }

    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}

// MARK: COMPONENTS
extension OnBoardingView {
    
    private var buttonsView: some View {
        Text(buttonText)
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(15)
            .animation(nil, value: UUID())
            .onTapGesture {
                handlePressButton()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .overlay(
                    Capsule()
                        .frame(height: 3)
                        .offset(y: 5),
                    alignment: .bottom
                )
                .foregroundColor(.white)
            Text("Number 1 app for finding your match. I'm studying iOS since ever, let's try to work now. Let's gooo!!! Work harder.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()

        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .foregroundColor(.purple)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing: 20) {
                Text("What's your age?")
               //
                Text("\(String(format: "%.0f", age))")
            }
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Menu {
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Other").tag("Other")
                } label: {}
            } label: {
                Text(gender.count > 1 ? gender : "Select your gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }

            Picker("Select your gender", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            .pickerStyle(.segmented)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
}

// MARK: FUNCTIONS
extension OnBoardingView {
    
    private func handlePressButton() {
        
        switch onboardingState {
        case 1:
            if name.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
                showAlert(msg: "Please enter your name.")
                return
            }
        case 3:
            if gender.count < 1 {
                showAlert(msg: "Please select a gender")
                return
            }
        default:
            break
        }
        
        if onboardingState < 3 {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        } else {
            signIn()
        }
        switch onboardingState {
        case 1..<3:
            buttonText = "Next"
        case 3:
            buttonText = "Finish"
        default:
            buttonText = "Sign Up"
        }
        
        
    }
    
    private func showAlert(msg: String) {
        alertMsg = msg
        showAlert.toggle()
    }
    
    private func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            isSignedIn.toggle()
        }
    }
    
}
