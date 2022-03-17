//
//  CustomTextField.swift
//  CombineProject
//
//  Created by pavels.garklavs on 17/03/2022.
//

import UIKit

class CustomTextField: UITextField {
    
    private let textPadding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    @Published var isValid = false {
        didSet {
            guard let validColor = UIColor(named: "valid-color") else { return }
            isValid ? setRightView(tintColor: validColor) : setRightView(tintColor: .red)
        }
    }

    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor : UIColor.lightGray])
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupTextField()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
}

private extension CustomTextField {
    func setupTextField() {
        backgroundColor = UIColor(named: "textfield-background-color")
        textColor = .black
        layer.cornerRadius = 5
    }
    
    func setRightView(tintColor: UIColor) {
        rightView = checkMarkIcon.make(textField: self, tintColor: tintColor)
    }
}
