//
//  ContentView.swift
//  PasscodeLockScreen
//
//  Created by Dhruv Sharma on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAutheticated = false
    var body: some View {
        VStack {
            if isAutheticated{
                VStack{
                    Text("You're in!")
                    
                    Button("Log Out"){
                        isAutheticated = false
                    }
                }
            }
            else{
                PasscodeView(isAuthenticated: $isAutheticated)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
