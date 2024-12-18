//
//  ContentView.swift
//  Smacro
//
//  Created by Junho Oh on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var macroType: String = ""
    
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
                    
                    Button(action: {
                        macroType = "Protein"
                        isActive = true
                    }, label: {
                        Image("beef")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    
                    Button(action: {
                        macroType = "Carbs"
                        isActive = true
                    }, label: {
                        Image("milk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    
                    Button(action: {
                        macroType = "Fats"
                        isActive = true
                    }, label: {
                        Image("chickenbreast")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
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
                InputMacros(isActive: $isActive, title: macroType, buttonTile: "Submit")
                    
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
