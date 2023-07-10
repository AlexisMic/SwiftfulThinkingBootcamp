//
//  AsyncImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Alexis Schotte on 30/06/2023.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                } else {
                    Image(systemName: "questionmark")
                }
            }
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                case .failure(_):
                    Image(systemName: "questionmark")
                default:
                    Image(systemName: "questionmark")
                }
            }
            
            AsyncImage(url: url) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }

            
            AsyncImage(url: url)
            
            
        }
        
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
