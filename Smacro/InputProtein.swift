//
//  InputProtein.swift
//  Smacro
//
//  Created by Jason Mauro on 6/21/24.
//

import SwiftUI

struct InputProtein: View{
    let title: String
    
    
    
    
    var body: some View {
        
        @State var input: String = ""
        
        ZStack{
            
            Color(.systemOrange).ignoresSafeArea()
            
            
            VStack(spacing : 0.1){
                
                Text(title)
                    .font(.title)
                    .bold()
                    .padding()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                    
                    TextField("Protein: ", text: $input)
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(.white)
                }
                
                
                
            }
            .background(.gray)
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: true)
            .padding();
            
        }
    }
    
}

struct InputProtein_Preivew: PreviewProvider{
    static var previews: some View{
        InputProtein(title: "Input Protein (grams)")
    }
}
