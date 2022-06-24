//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Марк Кобяков on 23.06.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let setUpProfileLabel = UILabel(text: "Set up profile", font: .avenir26())
    let fullImageView = AddPhotoView()
    
    let fullNameStack: UIStackView = {
        let fullNameLabel = UILabel(text: "Full name", font: .avenir20())
        let fullNameTextField = OneLineTextField(font: .avenir20())
        
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        
        return stackView
    }()
    
    let aboutMeStack: UIStackView = {
        let aboutMeLabel = UILabel(text: "About me")
        let aboutMeTextField = OneLineTextField(font: .avenir20())
        
        let stackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        
        return stackView
    }()
    
    let sexStack: UIStackView = {
        let sexLabel = UILabel(text: "Sex")
        let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
        
        let stackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 12)
        
        return stackView
    }()
    
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark(), font: .avenir20(), isShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        setupConstraints()
    }
}

// MARK: Extension AuthViewController

extension SetupProfileViewController {
    private func setupConstraints() {
        
        setUpProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(setUpProfileLabel)
        view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            setUpProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            setUpProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: setUpProfileLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [fullNameStack, aboutMeStack, sexStack, goToChatsButton], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}



import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View { 
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileViewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> SetupProfileViewController {
            return setupProfileViewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
