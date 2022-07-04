//
//  VCFactory.swift
//  iChat
//
//  Created by Марк Кобяков on 04.07.2022.
//

import UIKit

class VCFactory {
    enum ViewControllers {
        case AuthVC
        case SignUpVC
        case LoginVC
        case SetupProfile
    }
    
    static func getVC(vc: ViewControllers) -> UIViewController {
        switch vc {
        case .AuthVC:
            return AuthViewController()
        case .SignUpVC:
            return SignUpViewController()
        case .LoginVC:
            return LoginViewController()
        case .SetupProfile:
            return SetupProfileViewController()
        }
    }
}
