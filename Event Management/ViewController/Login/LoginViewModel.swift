//
//  LoginVCM.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

class LoginMainViewModel:NSObject {
    static let shared = LoginMainViewModel()
    
    //MARK: - Variable
    var strUsername = ""
    var strPassword = ""
    
    //MARK: - Validation
    func validate(user username:String,pass password:String) -> String {
        var validationMeassge = ""
        if !username.trim.emailValidation1 {
            validationMeassge = "Enter Email"
        }else if !password.trim.passwordValidation {
            validationMeassge = "Enter Password"
        }else {
            strUsername = username
            strPassword = password
        }
        
        return validationMeassge
    }
    
}
