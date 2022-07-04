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
        auth.signIn(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
}
