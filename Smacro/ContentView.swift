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
    @State private var protein: String = "0"
    @State private var carbohydrates: String = "0"
    @State private var fats: String = "0"
    
    var body: some View {
        
        ZStack {
            Color(.systemOrange)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 5.0) {
                HStack {
                    
                    Button(action: {
                        macroType = "Protein"
                        isActive = true 
                    }, label: {
                        Text("Protein")
                            
                    })
                    
                    Button(action: {
                        macroType = "Carbohydrates"
                        isActive = true
                    }, label: {
                        Text("Carbohydrates")
                    })
                    
                    Button(action: {
                        macroType = "Fats"
                        isActive = true
                    }, label: {
                        Text("Fats").padding(3)
                    })
                }
                Text("Macro Count")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Protein: \(protein)")
                Text("Carbohydrates: \(carbohydrates)")
                Text("Fats: \(fats)")
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white).cornerRadius(10).shadow(radius: 15))
            .padding()
            
            if isActive {
                InputMacros(isActive: $isActive, title: macroType, buttonTile: "Submit", onSubmit: { newValue in accumulateMacro(newValue: newValue, for: macroType)})
                    
            }
        }
        
        
    }

    func accumulateMacro(newValue: String, for macroType: String) {
        guard let newAmount = Double(newValue) else { return }
        
        switch macroType {
        case "Protein":
            if let currentAmount = Double(protein) {
                protein = String(currentAmount + newAmount)
            }
        case "Carbohydrates":
            if let currentAmount = Double(carbohydrates) {
                carbohydrates = String(currentAmount + newAmount)
            }
        case "Fats":
            if let currentAmount = Double(fats) {
                fats = String(currentAmount + newAmount)
            }
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
