//
//  RegistrationView.swift
//  IntelliPlus
//
//  Created by user on 9/4/23.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State  var textFileEmail: String = ""
    @State  var textFileContrasena: String = ""
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Hello", title2: "IntelliPlus")
            
            VStack(spacing: 40){
                CustomImputField(imageName: "envelope", plaveholderText: "Email", text: $textFileEmail)
                
                CustomImputField(imageName: "lock", plaveholderText: "Password", text: $textFileContrasena)
                 
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view..")
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button{
                authenticationViewModel.createNewUser(email: textFileEmail, password: textFileContrasena)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
     
        }
        .ignoresSafeArea()
       
  
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(authenticationViewModel: AuthenticationViewModel())
    }
}
