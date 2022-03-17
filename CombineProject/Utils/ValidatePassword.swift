//
//  ValidatePassword.swift
//  CombineProject
//
//  Created by pavels.garklavs on 17/03/2022.
//

import UIKit

struct ValidatePassword {
    
    private init() {}
    
    static func validate(input: String) -> Bool {
        let passwordRegex = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        return input.range(of: passwordRegex, options: .regularExpression) != nil
    }
}
