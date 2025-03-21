//
//  ForgotPasswordViewModel.swift
//  Event Management
//
//  Created by Jaymin on 21/03/25.
//

import Foundation
import UIKit

class ForgotPasswordViewModel:NSObject {
    static let shared = ForgotPasswordViewModel()
   
    //MARK: - Variable
    
    var strOldPassword = ""
    var strNewPassword = ""
    var strConfirmNewPassword = ""
    
    //MARK: - Validation
    
    func validate(oldPassword oldPass:String, NewPassword newPass:String,confimrNewPassword confirmNewPass:String) -> String {
        
        var validationMeassge = ""
        if !oldPass.trim.passwordValidation {
            validationMeassge = "Enter Old Password"
        }else if !newPass.trim.passwordValidation {
            validationMeassge = "Enter New Password"
        }else if !confirmNewPass.trim.passwordValidation {
            validationMeassge = "Enter Confirm New Password"
        }else {
            strOldPassword = oldPass
            strNewPassword = newPass
            strConfirmNewPassword = confirmNewPass

            
        }
        return validationMeassge
    }
}
