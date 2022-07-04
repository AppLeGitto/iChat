//
//  ViewController.swift
//  iChat
//
//  Created by Марк Кобяков on 17.06.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnBoardLabel = UILabel(text: "Already on board?")

    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .black, isShadow: false)
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    let googleButton = UIButton(title: "Google", titleColor: .buttonDark(), backgroundColor: .white, isShadow: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        googleButton.customizeGoogleButton()
        
        view.backgroundColor = .mainWhite()
        
        setupConstraints()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func emailButtonTapped() {
        
        present(VCFactory.getVC(vc: .SignUpVC), animated: true)
    }
    
    @objc private func loginButtonTapped() {
        present(VCFactory.getVC(vc: .LoginVC), animated: true)
    }
}

// MARK: - Extension AuthViewController

extension AuthViewController {
    private func setupConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        let googleView = ButtonFromView(label: googleLabel, button: googleButton)
        let emailView = ButtonFromView(label: emailLabel, button: emailButton)
        let loginView = ButtonFromView(label: alreadyOnBoardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    }
}

import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let authViewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            return authViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}

