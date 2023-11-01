//
//  CapaImageView.swift
//  IntelliPlus
//
//  Created by user on 4/4/23.
//

import SwiftUI

struct CapaImageView: View {
    @StateObject var viewModel = ViewModel()
    @State var text = ""
    @State var selectedImage: Image?
    @State var emptyImage: Image = Image(systemName: "photo.on.rectangle.angled")
    
    var currentImage: some View {
        if let selectedImage = selectedImage {
            return selectedImage
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
        } else {
            return emptyImage
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
        }
    }
    
    var body: some View {
       
        ScrollView{
        VStack{
            Divider().overlay(.gray).frame(height: 1).opacity(0.4)
            headerView
            
            AsyncImage(url: viewModel.imageURL) { image in
                image
                    .resizable()
                .scaledToFit()
                
            } placeholder: {
                VStack{
                    if !viewModel.isLoading{
                        ZStack{
                            currentImage
                        }
                            
                    } else {
                       ProgressView()
                            .padding(.bottom, 12)
                        Text("Espere un momento")
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 420, height: 300)
                .background(.gray.opacity(0.1))
            }
          
            VStack(spacing: 0) {
                TextField("text-File", text: $text)
                    .foregroundColor(.black)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                
            Button("gererar-imagen-button"){
                Task{
                   await viewModel.generateImagen(withText: text)
                }
                
            }
            
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
            .padding(.vertical)
                Divider().overlay(.gray).frame(height: 1).opacity(0.4)
            
        }
            .padding()
        }
  
    }
}

var headerView : some View{
    HStack{
        Image("ImageIcono")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
        
        VStack{
            HStack {
                Text("Intelli_Plus")
                    .font(.system(size: 25, weight: .bold))
            }
            Text("Artificial")
                .font(.system(size: 20))
        }
        Spacer()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal)

    }
}

struct CapaImageView_Previews: PreviewProvider {
    static var previews: some View {
        CapaImageView()
    }
}
