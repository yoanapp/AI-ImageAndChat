//
//  ImageContentView.swift
//  IntelliPlus
//
//  Created by user on 4/4/23.
//

import SwiftUI

struct ImageContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ScrollView(.horizontal) {
                        HStack(spacing: 3){
                            Image("BeautifulWoman")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 250)
                                .cornerRadius(20)
                               
                            
                            Image("Kitten")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 250)
                                .cornerRadius(20)
                            
                            Image("anime")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 250)
                                .cornerRadius(20)
                            
                            Image("nina")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 250)
                                .cornerRadius(20)
                        }
                        .padding(.horizontal)
                    }
                    GenerateImageView(authenticationViewModel: AuthenticationViewModel())
                    
                }
          
  }
            .navigationTitle("gererar-imagen-button")
            .toolbar {
                Button{
                    print("Action Button")
                } label: {
                    Label(systemname: "arrow.counterclockwise.circle.fill")
                }
            }
           
 }
        
}

}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView()
    }
}
