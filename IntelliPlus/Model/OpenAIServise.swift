//
//  OpenAIService.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import Foundation
import Combine
import Alamofire

class OpenAIServise{
    let baseURL = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
        let body = OpenAICompletionBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 1500)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIAPIKey)"]
        
        return Future { [weak self] promise in
            guard let self = self else {return}
            AF.request(self.baseURL + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompletionsResponse.self) { response in
                switch response.result{
                case .success(let result):
                    promise(.success(result))
                case .failure(let error):
                    promise(.failure(error))
                }
                
        }
    }
        .eraseToAnyPublisher()
    }
}

struct OpenAICompletionBody: Encodable{
    let model: String
    let prompt: String
    let temperature: Float
    let max_tokens: Int
}

struct OpenAICompletionsResponse: Decodable {
    let id: String
    let choices: [OptionAICompletionsChoice]
}

struct OptionAICompletionsChoice: Decodable {
    let text: String
}

