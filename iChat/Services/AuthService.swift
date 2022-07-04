//
//  AuthService.swift
//  iChat
//
//  Created by Марк Кобяков on 04.07.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthService {
    
    static var shared = AuthService()
    
    private let auth = Auth.auth()
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> ()) {
        
        guard let email = email, let password = password else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> ()) {
        
        guard Validators.isFill(email: email, password: password, confirmPassword: confirmPassword) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard password == confirmPassword else {
            completion(.failure(AuthError.passwordsNotMatched))
            return
        }
        
        guard Validators.isSimpleEmail(email: email) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
}
