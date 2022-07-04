//
//  InsetableTextField.swift
//  iChat
//
//  Created by Марк Кобяков on 30.06.2022.
//

import UIKit

class InsetableTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        placeholder = "White something here ..."
        font = .systemFont(ofSize: 14)
        borderStyle = .none
        clearButtonMode = .whileEditing
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        let image = UIImage(systemName: "smiley")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .lightGray
        leftView = imageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        leftViewMode = .always
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Sent"), for: .normal)
        rightView = button
        rightView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        rightViewMode = .always
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -12
        
        return rect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct InsetableTextFieldProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
         
        let profileViewController = ProfileViewController()
        
        func makeUIViewController(context: Context) -> ProfileViewController {
            return profileViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}

