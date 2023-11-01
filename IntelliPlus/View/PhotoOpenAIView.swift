//
//  PhotoOpenAIView.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI

struct PhotoOpenAIView: View {
    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View{
        VStack(spacing: 20){
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.teal)
            
            Text(title)
                .font(.title).bold()
            
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
        }
        padding(.horizontal, 40)
    }
}

struct PhotoOpenAIView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoOpenAIView(systemImageName: "dial.min.fill" , title: "OpenAI", description: "Facilita tu vida usando a tu gusto la inteligencia artificial de OpenAi")
        }
}
