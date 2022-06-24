//
//  UIImage + Extension.swift
//  iChat
//
//  Created by Марк Кобяков on 17.06.2022.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
