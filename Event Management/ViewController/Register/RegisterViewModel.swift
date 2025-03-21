//
//  Register.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//


import Foundation
import UIKit

class RegisterViewModel:NSObject {
    static let shared = RegisterViewModel()
   
    //MARK: - Variable
    
    var strUsername = ""
    var strEmail = ""
    var strPhoneNumber = ""
    var strPassword = ""
    
    //MARK: - Validation
    
    func validate(Username username:String, phone phoneNo:String,email Email:String,pass password:String) -> String {
        
        var validationMeassge = ""
        if username.trim.length == 0 || username.trim.nameValidation {
            validationMeassge = "Enter User Name"
        }else if !Email.trim.emailValidation1 {
            validationMeassge = "Enter Email"
        }else if !phoneNo.trim.PhoneNumberValidation {
            validationMeassge = "Enter Phone Number"
        }else if !password.trim.passwordValidation {
            validationMeassge = "Enter Password"
        }else {
            strUsername = username
            strEmail = Email
            strPhoneNumber = phoneNo
            strPassword = password
            
        }
        return validationMeassge
    }
}
