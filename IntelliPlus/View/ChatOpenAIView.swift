//
//  ChatOpenAIView.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI
import Combine

struct ChatOpenAIView: View {
    @State var chatMesseges: [ChatMessage] = ChatMessage.sampleMesseges
    @State var menssageText: String = ""
    let openAIService = OpenAIServise()
    @State var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        NavigationView{
            VStack{
            ScrollView{
                LazyVStack{
                    ForEach(chatMesseges, id: \.id) { message in
                        messagerView(message: message)
                        
                    }
                }
            }
                HStack{
                    TextField("placeholder-TextFile", text: $menssageText){
                        
                    }
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(12)
                 
                    
                    Button{
                        sendMenssage()
                    } label: {
                        Text("button-send")
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
            .navigationTitle("title-NavigationBar")
        }
     
    }
    
    
    func messagerView(message: ChatMessage) -> some View {
        
        HStack{
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .white)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.8))
                .cornerRadius(16)
                
            if message.sender == .gpt{Spacer()}
        }
    }
    
    func sendMenssage() {
        let myMessege = ChatMessage(id: UUID().uuidString, content: menssageText, dateCreated: Date(), sender: .me)
        chatMesseges.append(myMessege)
        
        openAIService.sendMessage(message: menssageText).sink { completion in
            //Handle error
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
            let gptMesssage = ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            chatMesseges.append(gptMesssage)
            
        }
        .store(in: &cancellables)
        menssageText = ""
    }
}

struct ChatOpenAIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatOpenAIView()
            .preferredColorScheme(.light)
    }
}

struct ChatMessage{
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender{
    case me
    case gpt
}

extension ChatMessage{
    static let sampleMesseges = [
        ChatMessage(id: UUID().uuidString, content: "Hola", dateCreated: Date(), sender: .me)
    ]
}
