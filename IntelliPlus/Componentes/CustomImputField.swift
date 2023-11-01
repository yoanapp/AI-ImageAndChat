//
//  CustomImputField.swift
//  IntelliPlus
//
//  Created by user on 9/4/23.
//

import SwiftUI

struct CustomImputField: View {
    let imageName: String
    let plaveholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(plaveholderText, text: $text)
            }
            
            Divider().background(Color(.darkGray))
        }
        
    }
}

struct CustomImputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomImputField(imageName: "envelope", plaveholderText: "Email", text: .constant(""))
    }
}
