//
//  CustomButton.swift
//  CombineProject
//
//  Created by pavels.garklavs on 17/03/2022.
//

import UIKit

class CustomButton: UIButton {

    init() {
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}

private extension CustomButton {
    func setupButton() {
        setTitleColor(.lightGray, for: .highlighted)
        setTitleColor(.lightGray, for: .disabled)
        titleLabel?.textColor = .white
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        backgroundColor = .blue
        layer.cornerRadius = 5
    }
    
    func setBackgroundColor(color: UIColor) {
        backgroundColor = color
    }
}
