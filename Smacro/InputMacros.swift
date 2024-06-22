//General Class for inputting macros to the tracker

import SwiftUI

struct InputMacros: View{
    
    @Binding var isActive: Bool
    let title: String
    @State private var offset: CGFloat = 1000
    @State var input: String = ""
    
    var body: some View {
        ZStack{
            BlurView(style: .systemMaterial)
                .ignoresSafeArea()
            
            VStack(spacing : 5){
                
                Text("Input " + title + " (g)")
                    .font(.title)
                    .bold()
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.gray)
                    
                    TextField("0.0", text: $input)
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(.white)
                        .cornerRadius(10)
                    
                }.padding(6)
            
                Button{
                    updateMacros(input: input)
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
                }
                
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding(20)
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
    
    func updateMacros(input: String) {
        //Check if the value can be converted to a double
        guard let inputValue = Double(input) else {
            //Send an error and make them reinput
            return
        }

        switch title {
        case "Protein":
            ContentView.Protein += inputValue
        case "Fats":
            ContentView.Fats += inputValue
        case "Carbs":
            ContentView.Carbs += inputValue
        default:
            break
        }
    }
    
}

struct InputMacros_Preivew: PreviewProvider{
    static var previews: some View{
        InputMacros(isActive: .constant(true), title: "Macros")
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
