//
//  RegistrationViewController.swift
//  PixaBay
//
//  Created by Rezo Joglidze on 05.08.22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: Subviews
    private let scrollView: UIScrollView = {
        let scrollableView = UIScrollView()
        scrollableView.translatesAutoresizingMaskIntoConstraints = false
        scrollableView.bounces = false
        scrollableView.showsVerticalScrollIndicator = false
        return scrollableView
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .red
        textField.keyboardType = .emailAddress
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.placeholder = "შეიყვანეთ ელ-ფოსტა"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.placeholder = "შეიყვანეთ პაროლი"
        return textField
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("რეგისტრაცია", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.9)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var viewModel: RegistrationViewModel!
    
    // MARK: - Lifecycle
    static func create(with viewModel: RegistrationViewModel) -> RegistrationViewController {
        let viewController: RegistrationViewController = .init()
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: Setup
    private func setUp() {
        setUpView()
        addSubviews()
        setUpLayout()
    }
    
    private func setUpView() {
        view.backgroundColor = .lightGray
        //        dismissKeyboardOnOutsideTap()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        textFieldStackView.addArrangedSubview(mailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        scrollView.addSubview(textFieldStackView)
        scrollView.addSubview(registrationButton)
    }
    
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 56),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textFieldStackView.topAnchor.constraint(greaterThanOrEqualTo: scrollView.topAnchor, constant: 20),
            textFieldStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            textFieldStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            registrationButton.heightAnchor.constraint(equalToConstant: 56),
            registrationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            registrationButton.topAnchor.constraint(greaterThanOrEqualTo: textFieldStackView.bottomAnchor, constant: 50),
            registrationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }
}

extension RegistrationViewController: UITextFieldDelegate {
}
