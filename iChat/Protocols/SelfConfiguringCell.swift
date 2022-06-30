//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Марк Кобяков on 28.06.2022.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    
    func configure<U: Hashable>(with value: U)
}
