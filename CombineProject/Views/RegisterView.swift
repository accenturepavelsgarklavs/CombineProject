//
//  RegisterView.swift
//  CombineProject
//
//  Created by pavels.garklavs on 16/03/2022.
//

import UIKit
import Combine

final class RegisterView: UIView {
    
    private var cancellables = Set<AnyCancellable>()
    private let titleLabel = UILabel()
    private let userNameTextField = CustomTextField()
    private let firstPasswordTextField = CustomTextField()
    private let secondPasswordTextField = CustomTextField()
    private let registerButton = CustomButton()
    
    private var usernameValid = false
    private var passwordMatches = false

    required init() {
            super.init(frame: .zero)
            setupView()
    }
        required init?(coder: NSCoder) {
            fatalError("")
        }

}

private extension RegisterView {
    func setupView() {
        setupPublishers()
        setupTitle()
        setupUsernameTextField()
        setupFirstPasswordTextField()
        setupSecondPasswordTextField()
        setupRegisterButton()
        
    }
    
    func setupTitle() {
        addSubview(titleLabel)
        
        titleLabel.text = "REGISTER"
        titleLabel.font = .systemFont(ofSize: 48, weight: .bold)
        titleLabel.textColor = .blue
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setupUsernameTextField() {
        addSubview(userNameTextField)
                
        userNameTextField.rightView = checkMarkIcon.make(textField: userNameTextField, tintColor: .red)

        userNameTextField.placeholder = "Username"
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    func setupFirstPasswordTextField() {
        addSubview(firstPasswordTextField)
        
        firstPasswordTextField.rightView = checkMarkIcon.make(textField: firstPasswordTextField, tintColor: .red)

        firstPasswordTextField.placeholder = "Required Password"
        firstPasswordTextField.isSecureTextEntry = true
        
        firstPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    func setupSecondPasswordTextField() {
        addSubview(secondPasswordTextField)
        
        secondPasswordTextField.rightView = checkMarkIcon.make(textField: secondPasswordTextField, tintColor: .red)
        
        secondPasswordTextField.placeholder = "Re-Enter Password"
        secondPasswordTextField.isSecureTextEntry = true
        
        secondPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(firstPasswordTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    func setupRegisterButton() {
        addSubview(registerButton)
        
        registerButton.setTitle("Register", for: .normal)
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(secondPasswordTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        Publishers.CombineLatest3(userNameTextField.$isValid, firstPasswordTextField.$isValid, secondPasswordTextField.$isValid)
            .map({ $0 && $1 && $2 })
            .assign(to: \.isEnabled, on: registerButton)
            .store(in: &cancellables)
    }
    
    @objc func registerButtonTapped() {
        print("Button Tapped")
    }
    
    func setupPublishers() {
        
        var firstPassword = ""
        
        userNameTextField.textPublisher
            .sink { [weak self] text in
                guard let self = self else { return }
                self.userNameTextField.isValid = ValidateUsername.validate(input: text)
            }.store(in: &cancellables)
        
        firstPasswordTextField.textPublisher
            .sink { [weak self] text in
                guard let self = self else { return }
                self.firstPasswordTextField.isValid = ValidatePassword.validate(input: text)
                firstPassword = text
            }.store(in: &cancellables)
        
        secondPasswordTextField.textPublisher
            .sink { [weak self] text in
                guard let self = self else { return }
                if text == firstPassword {
                    self.secondPasswordTextField.isValid = ValidatePassword.validate(input: text)
                }
            }.store(in: &cancellables)
    }
}
