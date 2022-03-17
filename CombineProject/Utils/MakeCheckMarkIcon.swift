//
//  MakeCheckMarkIcon.swift
//  CombineProject
//
//  Created by pavels.garklavs on 16/03/2022.
//

import UIKit

struct checkMarkIcon {
    
    private init() {}
    
    static func make(textField: UITextField, tintColor: UIColor) -> UIView {
        textField.rightViewMode = .always
        let checkmarkImageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 16, height: 16))
        let image = UIImage(systemName: "checkmark.circle.fill")
        checkmarkImageView.tintColor = tintColor
        checkmarkImageView.contentMode = .scaleAspectFit
        checkmarkImageView.image = image
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        view.addSubview(checkmarkImageView)
        
        return view
    }
}
