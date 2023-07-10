//
//  NavigationStackBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 02/07/2023.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
    private var linkInt = 0
    @State private var path: [ViewPaths] = []
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    
//                    ForEach(0 ..< 10) { item in
////                        NavigationLink(" View \(item)", destination: {
////                            SecondView(myInt: item)
////                        })
//                        NavigationLink(value: item) {
//                            Text("View \(item)")
//                        }
//
//                    }
                     
                    
                    NavigationLink(value: ViewPaths.secondView) {
                        Text("Second View")
                    }

                    NavigationLink(value: ViewPaths.thirdView) {
                        Text("Third View")
                    }
                    
                    Button("go deep") {
                        path.append(contentsOf: [.secondView, .thirdView])
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Nav Bootcamp")
//            .navigationDestination(for: Int.self) { value in
//                switch value {
//                case 0:
//                    SecondView(myInt: 0)
//                case 1:
//                    ThirdView(myInt: 1)
//                default:
//                    EmptyView()
//                }
//            }
            .navigationDestination(for: ViewPaths.self) { value in
                switch value {
                case .secondView:
                    SecondView(myInt: 0)
                case .thirdView:
                    ThirdView(myInt: 0)
                }
            }
        }
    }
    
    enum ViewPaths {
    case secondView, thirdView
    }
}


struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}


struct SecondView: View {
    
    var myInt: Int
    
    init(myInt: Int) {
        self.myInt = myInt
        print("Second View \(myInt)")
    }
    
    var body: some View {
//        let _ = Self._printChanges()

        Text("Second View \(myInt)")
    }
}

struct ThirdView: View {
    
    var myInt: Int
    
    init(myInt: Int) {
        self.myInt = myInt
        print("Third View \(myInt)")
    }
    
    var body: some View {
//        let _ = Self._printChanges()

        Text("Third View \(myInt)")
    }
}
