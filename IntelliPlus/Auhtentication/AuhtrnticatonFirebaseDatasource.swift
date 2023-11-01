//
//  AuhtrnticatonFirebaseDatasource.swift
//  IntelliPlus
//
//  Created by user on 7/4/23.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuhtrnticatonFirebaseDatasource {
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else{
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creando el usuario\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
                
            }
            let email = authDataResult?.user.email ?? "No email"
            print("New user created with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error login el usuario\(error.localizedDescription)")
                completionBlock(.failure(error))
                return
                
            }
            let email = authDataResult?.user.email ?? "No email"
            print("user login with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    func logout() throws {
        try Auth.auth().signOut()
    }
}
