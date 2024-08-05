//
//  ContentView.swift
//  CustomAlert
//
//  Created by Elio Fernandez on 17/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showAlert = true
                }) {
                    Text("Show Custom Alert")
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .blur(radius: showAlert ? 2 : 0)
            .opacity(showAlert ? 0.3 : 1)
            .animation(.easeInOut, value: showAlert)
            
            if showAlert {
                CustomAlertView(viewModel: CustomAlertViewModel(state: .init(type: .cancelSwapRegistration, isActive: $showAlert)))
                    .transition(.opacity.animation(.easeInOut))
            }
        }
    }
}

#Preview {
    ContentView()
}
