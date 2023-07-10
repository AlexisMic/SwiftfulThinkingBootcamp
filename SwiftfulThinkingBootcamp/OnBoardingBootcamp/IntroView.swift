//
//  IntroView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 6/28/23.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var isSignedIn: Bool = false
    private var transition1: AnyTransition = .asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
    private var transition2: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
 
    var color1 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) // use #colorLiteral(
    var color2 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                gradient: Gradient(colors: [Color(uiColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(uiColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            
            // content
            if isSignedIn {
                ProfileView()
                    .transition(transition1)
            } else {
                OnBoardingView()
                    .transition(transition2)
            }
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
