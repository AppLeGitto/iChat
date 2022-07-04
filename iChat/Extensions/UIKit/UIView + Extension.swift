//
//  UIView + Extension.swift
//  iChat
//
//  Created by Марк Кобяков on 01.07.2022.
//

import UIKit

extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        backgroundColor = .none
        layoutIfNeeded()
        
        let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.8309458494, green: 0.7057176232, blue: 0.9536159635, alpha: 1), endColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = cornerRadius
            
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
