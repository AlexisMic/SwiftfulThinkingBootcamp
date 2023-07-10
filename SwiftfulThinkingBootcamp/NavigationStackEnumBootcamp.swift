//
//  NavigationStackEnumBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 10/07/2023.
//

import SwiftUI

struct NavigationStackEnumBootcamp: View {
    var body: some View {
        NavigationStack {
//            ForEach(DestinationViews.allCases) { destination in
//                NavigationLink(destination.rawValue, value: destination)
//                    .buttonStyle(.bordered)
//                    .navigationDestination(for: DestinationViews.self) { destView in
//                        destView
//                }
//            }
            ForEach(DestinationViews.allCases) { destination in
                NavigationLink(destination.rawValue, value: destination)
                    .buttonStyle(.bordered)
                    .navigationDestination(for: DestinationViews.self) { $0 }
            }
        }
    }
}

struct NavigationStackEnumBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackEnumBootcamp()
    }
}

// Enum View
enum DestinationViews: String, Hashable, Identifiable, CaseIterable, View {
    case viewOrange = "Orange View"
    case viewRed = "Red View"
    case viewGreen = "Green View"
    
    var id: String {
        self.rawValue
    }
    
    var body: some View {
        switch self {
        case .viewOrange:
            ViewOrange(title: self.rawValue)
        case .viewRed:
            ViewRed(title: self.rawValue)
        case .viewGreen:
            ViewGreen(title: self.rawValue)
        }
    }
}

struct ViewOrange: View {
    let title: String
    var body: some View {
        ZStack {
            Rectangle().fill(.orange)
                .ignoresSafeArea()
                .navigationTitle(title)
        }
    }
}

struct ViewRed: View {
    let title: String
    var body: some View {
        ZStack {
            Rectangle().fill(.red)
                .ignoresSafeArea()
                .navigationTitle(title)
        }
    }
}

struct ViewGreen: View {
    let title: String
    var body: some View {
        ZStack {
            Rectangle().fill(.green)
                .ignoresSafeArea()
                .navigationTitle(title)
        }
    }
}
