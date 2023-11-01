//
//  TabView.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI

struct Tabview: View {
    
    var body: some View {
          
        TabView {
            
            ImageContentView()
                .tabItem {
                    Image(systemName: "photo.fill")
                    Text("home-label-item")
                }
                .edgesIgnoringSafeArea(.top)
            
            //GenerateView()
            //    .tabItem {
            //    Image(systemName: "photo.fill")
            //        Text("Generar Imagen")
            //    }
            //    .edgesIgnoringSafeArea(.top)
            
            ChatOpenAIView()
                .tabItem {
                    Image(systemName: "message")
                    Text("title-NavigationBar")
                }
                .edgesIgnoringSafeArea(.top)
            
            UserProfileView(authenticationViewModel: AuthenticationViewModel())
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Mi Perfil")
                }
                .edgesIgnoringSafeArea(.top)
        }
        }
    }


struct Tabview_Previews: PreviewProvider {
    static var previews: some View {
        Tabview()
            .preferredColorScheme(.light)
    }
}
