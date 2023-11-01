//
//  UserProfileView.swift
//  IntelliPlus
//
//  Created by user on 10/4/23.
//

import SwiftUI
struct UserProfileView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            
            VStack{
                ScrollView {
                Divider().overlay(.gray).frame(height: 1).opacity(0.4)
              
                    VStack(spacing: 10) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .padding()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .background(Color(.systemBlue))
                            .clipShape(Circle())
                        
                        if let user = authenticationViewModel.user {
                            Text(user.email)
                        }
                        
                        Text("Email")
                        
                    }
                }
               Spacer()
                Button{
                    authenticationViewModel.logout()
                } label: {
                    Text("Close seccion")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            .navigationTitle("User Profile")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(authenticationViewModel: AuthenticationViewModel())
            .preferredColorScheme(.light)
    }
}
