//
//  ChatRequestViewController.swift
//  iChat
//
//  Created by Марк Кобяков on 01.07.2022.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human8"), contentMode: .scaleAspectFill)
    let containerView = UIView()
    let nameLabel = UILabel(text: "Alena Wayne", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "don't like it", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "Accept", titleColor: .white, backgroundColor: .brown, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: .red, backgroundColor: .clear, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeElements()
        setupConstraints()
    }
}

// MARK: - Setup Constraints
extension ChatRequestViewController {
    
    private func customizeElements() {
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        aboutMeLabel.numberOfLines = 0
        
        denyButton.layer.borderColor = UIColor.buttonRed().cgColor
        denyButton.layer.borderWidth = 1
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.acceptButton.applyGradients(cornerRadius: 10)
    }
    
    private func setupConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 10)
        stackView.distribution = .fillEqually
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

import SwiftUI

struct ChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
         
        let chatRequestViewController = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> ChatRequestViewController {
            return chatRequestViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}

