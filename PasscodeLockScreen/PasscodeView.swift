//
//  PasscodeView.swift
//  PasscodeLockScreen
//
//  Created by Dhruv Sharma on 05/02/24.
//

import SwiftUI

struct PasscodeView: View {
    @State private var passcode = ""
    @Binding var isAuthenticated: Bool
    var body: some View {
        VStack(spacing: 48){
            VStack(spacing: 24){
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Please enter your 4-digit pin to securely access your account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            } .padding(.top)
            
            // indicator view
            PasscodeIndicatorView(passcode: $passcode)
            Spacer()
            //numberpad view
            NumberPadView(passcode: $passcode)
        }.onChange(of: passcode, perform: { value in
            verifyPasscode()
        })
    }
    private func verifyPasscode(){
        guard passcode.count == 4 else{ return }
        
        Task{
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "1111"
            passcode = ""
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
