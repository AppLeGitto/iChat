//
//  AuthError.swift
//  iChat
//
//  Created by Марк Кобяков on 04.07.2022.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatched
    case serverError
    case unknownError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Неправильный email", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Пароли не совпадают", comment: "")
        case .serverError:
            return NSLocalizedString("Сервер не отвечает", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        }
    }
}
