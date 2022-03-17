//
//  ValidateUsername.swift
//  CombineProject
//
//  Created by pavels.garklavs on 17/03/2022.
//

import UIKit

struct ValidateUsername {
    
    private init() {}
    
    static func validate(input: String) -> Bool {
        let usernameRegex = "\\A\\w{7,18}\\z"
        return input.range(of: usernameRegex, options: .regularExpression) != nil
    }
}
