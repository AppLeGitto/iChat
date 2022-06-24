//
//  OneLineTextField.swift
//  iChat
//
//  Created by Марк Кобяков on 18.06.2022.
//

import UIKit

class OneLineTextField: UITextField {
    
    convenience init(font: UIFont?) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomView = UIView(frame: .zero)
        bottomView.backgroundColor = .systemGray3
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomView)
        
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
