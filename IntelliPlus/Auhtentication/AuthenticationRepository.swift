//
//  AuthenticationRepository.swift
//  IntelliPlus
//
//  Created by user on 7/4/23.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource: AuhtrnticatonFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuhtrnticatonFirebaseDatasource = AuhtrnticatonFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func getCurrentUser() -> User? {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, completioBlock: @escaping(Result<User, Error>) -> Void){
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completioBlock)
    }
    
    func login(email: String, password: String, completioBlock: @escaping(Result<User, Error>) -> Void){
        authenticationFirebaseDatasource.login(email: email, password: password, completionBlock: completioBlock)
    }
    func logout() throws {
        try authenticationFirebaseDatasource.logout()
    }
}
