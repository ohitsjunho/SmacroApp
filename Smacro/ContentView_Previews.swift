//
//  ContentView_Previews.swift
//  Smacro
//
//  Created by Jason Mauro on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var showAlert: Bool = false
    @State private var numberInput: Int?

    var body: some View {
        VStack {
            if let number = numberInput {
                Text("Submitted Number: \(number)")
                    .padding()
            }

            Button("Enter a Number") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Enter a Number"),
                    message: TextField("Number", text: $userInput)
                        .keyboardType(.numberPad)
                        .onSubmit {
                            submitNumber()
                        },
                    primaryButton: .default(Text("Submit")) {
                        submitNumber()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .padding()
    }

    private func submitNumber() {
        if let number = Int(userInput) {
            numberInput = number
            userInput = ""
        } else {
            // Handle invalid input if needed
            numberInput = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
