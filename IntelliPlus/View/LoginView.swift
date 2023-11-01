//
//  LoginView.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI
 

struct LoginView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var contrasena: String = ""
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Hello", title2: "IntelliPlus")
            
            VStack(spacing: 40){
                Text("Email")
                    .padding(.horizontal)
                
                CustomImputField(imageName: "envelope", plaveholderText: "example@gmail.com", text: $email)
                Text("Password")
                CustomImputField(imageName: "lock", plaveholderText: "**********", text: $contrasena)
                 
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
            
            HStack(spacing: 0){
                Button{
                    
                    authenticationViewModel.createNewUser(email: email, password: contrasena)
                } label: {
                    Text("sigIn-Button")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:140, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
               
                
                Button{
                    authenticationViewModel.login(email: email, password: contrasena)
                        
                } label: {
                    Text("sigUp-Button")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:140, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
               
                
            }
            .padding(.horizontal, 0)
            .padding(.bottom, 100)
           
           /* NavigationLink{
                RegistrationView(authenticationViewModel: AuthenticationViewModel())
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))*/
            Spacer()
        }
        .ignoresSafeArea()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticationViewModel: AuthenticationViewModel())
            .preferredColorScheme(.light)
    }
}
