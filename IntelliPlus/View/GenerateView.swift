//
//  GenerateView.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI

struct GenerateView: View {
    @StateObject var viewModel = ViewModel()
    
    @State var text = ""
    
    var body: some View {
        
        
                VStack{
                
                    ScrollView(.horizontal){
                        
                        HStack(spacing: -20){
                            Image("IMG_5210")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 200)
                                
                                
                            Image("IMG_5210")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 200)
                                .foregroundColor(.teal)
                            
                            Image("IMG_5210")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 200)
                                .foregroundColor(.teal)
                        }
                    }
                  
                    Form {
                        Text("Se creativo, introduce un texto y la imagenen se creará a partir de èl.")
                            .font(.title3).italic()
                        AsyncImage(url: viewModel.imageURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            VStack{
                                if !viewModel.isLoading{
                                    Image(systemName: "photo.on.rectangle.angled")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                } else {
                                   ProgressView()
                                        .padding(.bottom, 12)
                                    Text("Espere un momento")
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .frame(width: 300, height: 300)
                        }
                        TextField("Describe la imagen q desea generar", text: $text)
                            .lineLimit(10)
                            .lineSpacing(5)
                        
                        HStack{
                            Spacer()
                            Button("Generar imagen"){
                                Task{
                                   await viewModel.generateImagen(withText: text)
                                }
                                
                            }
                            
                            .buttonStyle(.borderedProminent)
                            .disabled(viewModel.isLoading)
                            .padding(.vertical)
                            
                            Spacer()
                        }
                    }
                }
            
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
            .preferredColorScheme(.light)
    }
}
