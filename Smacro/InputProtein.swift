//
//  InputProtein.swift
//  Smacro
//
//  Created by Jason Mauro on 6/21/24.
//

import SwiftUI

struct InputProtein: View{
    @Binding var isActive: Bool
    let title: String
    let buttonTile: String
    let action: () -> ()
    @State private var offset: CGFloat = 1000
    
    
    var body: some View {
        
        
        @State var input: String = ""
        
        ZStack{
            
            BlurView(style: .systemMaterial)
                .ignoresSafeArea()
            
            
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
                        .cornerRadius(10)
                        
                    
            
                }.padding(6)
                
                
                Button{
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.orange)
                        
                        Text("Submit")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
                    
                }
                
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title)
                                .fontWeight(.medium)
                        }
                        .tint(.black)
                        
                    }
                    Spacer()
                }
                .padding()
            }
            .shadow(radius: 20)
            .padding(15)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()){
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
        }
        isActive = false;
    }
    
}

struct InputProtein_Preivew: PreviewProvider{
    static var previews: some View{
        InputProtein(isActive: .constant(true), title: "Input Protein (g)", buttonTile: "Submit", action: {})
    }
}


struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
