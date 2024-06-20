//
//  ContentView.swift
//  Smacro
//
//  Created by Junho Oh on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemOrange)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 5.0) {
                Image("macropie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                HStack {
                    Image("beef")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                    Image("milk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                    Image("chickenbreast")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                }
                Text("Smacro Count")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Protein:")
                Text("Carbohydrates:")
                Text("Fats:")
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white).cornerRadius(10).shadow(radius: 15))
            .padding()
        }
        
        
    }
}

#Preview {
    ContentView()
}
