//
//  ProfileViewController.swift
//  iChat
//
//  Created by Марк Кобяков on 30.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human6"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Alina Zaiceva", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "love it", font: .systemFont(ofSize: 16, weight: .light))
    let myTextField = InsetableTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeElements()
        setupConstraints()
    }
}

// MARK: - Setup Constraints
extension ProfileViewController {
    
    private func customizeElements() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        if let button = myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    
    @objc private func sendMessage() {
        
    }
    
    private func setupConstraints() {
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(myTextField)
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 12),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            myTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

import SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
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
