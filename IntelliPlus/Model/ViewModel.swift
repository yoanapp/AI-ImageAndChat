//
//  ViewModel.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import Foundation

final class ViewModel: ObservableObject{
    private let urlSession: URLSession
    @Published var imageURL: URL?
    @Published var isLoading = false
    
    init(urlSesion: URLSession = URLSession.shared){
        self.urlSession = urlSesion
    }
    
    func generateImagen(withText text: String) async {
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            return
        }
         var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        let dictionary: [String: Any] = [
            "n": 1,
            "size": "1024x1024",
            "prompt": text
        ]
        
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        
        do {
            DispatchQueue.main.async {
                self.isLoading = true
            }
            let (data, _) = try await urlSession.data(for: urlRequest)
            let model = try JSONDecoder().decode(ModelResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.isLoading = false
                guard let firstModel =  model.data.first else{
                    return
                }
                self.imageURL = URL(string: firstModel.url)
                print(self.imageURL ?? "No imageURL")
            }
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}
