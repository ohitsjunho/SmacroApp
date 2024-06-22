//General Class for inputting macros to the tracker

import SwiftUI

struct InputMacros: View{
    @Binding var isActive: Bool
    let title: String
    let buttonTile: String
    @State private var offset: CGFloat = 1000
    // @Binding var input: String
    @State var newInput: String = ""
    var onSubmit: (String) -> Void
    var body: some View {
        
        
        
        ZStack{
            
            BlurView(style: .systemMaterial)
                .ignoresSafeArea()
            
            
            VStack(spacing : 0.1){
                
                Text("Input " + title + " (g)")
                    .font(.title)
                    .bold()
                    .padding()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                    
                    TextField(title, text: $newInput) //Text Box for Inputting Macros
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(.white)
                        .cornerRadius(10)
                        
                    
            
                }.padding(6)
                
                
                Button{
                    updateMacros()
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
    
    func updateMacros() {
        onSubmit(newInput)
        newInput = ""
    }
    
}
/* Commented out as the parameters are not accepted during runtime
struct InputMacros_Preivew: PreviewProvider{
    static var previews: some View{
        InputMacros(isActive: .constant(true), title: "Macros", buttonTile: "Submit", input: String)
    }
}
*/

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
