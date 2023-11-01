//
//  AuthenticationViewModel.swift
//  IntelliPlus
//
//  Created by user on 7/4/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var mesageError: String?
    
    private let autenticationRepository: AuthenticationRepository
    
    init(autenticationRepository: AuthenticationRepository = AuthenticationRepository()){
        self.autenticationRepository = autenticationRepository
        getCurrentUser()
    }
    
    func getCurrentUser() {
        self.user = autenticationRepository.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String){
        autenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.mesageError = error.localizedDescription
            }
        }
    }
    
    func login(email: String, password: String){
        autenticationRepository.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.mesageError = error.localizedDescription
            }
        }
    }
    
    func logout() {
        do{
            try autenticationRepository.logout()
            self.user = nil
        } catch {
            print("Error loguot")
        }
    }
}
