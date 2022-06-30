//
//  WaitingChatCell.swift
//  iChat
//
//  Created by Марк Кобяков on 28.06.2022.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .init(width: 2, height: 2.5)
    }
    
    override func layoutSubviews() {
        setupConstraints()
        
        friendImageView.backgroundColor = .white
        friendImageView.layer.cornerRadius = 6
        friendImageView.layer.masksToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let value = value as? MChat else { fatalError() }
        
        self.friendImageView.image = UIImage(named: value.userImageString)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension WaitingChatCell {
    func setupConstraints() {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

import SwiftUI

struct WaitingChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
         
        let mainTabBarController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> MainTabBarController {
            return mainTabBarController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}

