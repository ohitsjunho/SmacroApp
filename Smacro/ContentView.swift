//
//  ContentView.swift
//  Smacro
//
//  Created by Junho Oh on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    
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
                    
                    Button(action: {
                        isActive = true
                    }, label: {
                        Image("milk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    
                    .foregroundColor(.black)
                    Image("chickenbreast")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                }
                Text("Macro Count")
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
            
            if isActive {
                InputProtein(isActive: $isActive, title: "Input Protein (g)", buttonTile: "Submit", action: {})
                    
            }
        }
        
        
    }
    
    func inputData() {
        print("s")
    }
}

#Preview {
    ContentView()
}
