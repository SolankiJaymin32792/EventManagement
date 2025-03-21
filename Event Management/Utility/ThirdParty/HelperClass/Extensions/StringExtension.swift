//
//  StringExtension.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var base64Encoded:String {
        return (self.data(using: .utf8)!).base64EncodedString()
    }
    
    var base64Decoded:String {
        return String(data: Data(base64Encoded: self)!, encoding: .utf8)!
    }
    
    var length: Int {
        return count
    }
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func regexMatch(_ regexStr:String) -> Bool {
        let regex: NSRegularExpression?
        do{
            try regex = NSRegularExpression(pattern: regexStr, options: .caseInsensitive)
        }catch{
            return false
        }
        
        if let matches = regex?.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0),range: NSMakeRange(0, self.count)) {
            return matches.count > 0
        } else {
            return false
        }
    }
    
    var emailValidation: Bool {
        let regex = "[^@]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        if !(predicate.evaluate(with: self)) {
            return false
        }else {
            return true
        }
    }
    
    var emailValidation1: Bool {
        let regex = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        if !(predicate.evaluate(with: self)) {
            return false
        }else {
            return true
        }
    }
    
    var nameValidation: Bool {
        let regex = ".*[^A-Za-z ].*"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        if !(predicate.evaluate(with: self)) {
            return false
        }else {
            return true
        }
    }
    
    var characterValidation: Bool {
        let regex = ".*[^A-Za-z].*"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    var characterValidationWithLimit: Bool {
        let regex = "^[A-Za-z]{0,100}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return (predicate.evaluate(with: self))
    }
    
    var characterValidationWithLimitForInitials: Bool {
        let regex = "^[A-Za-z]{0,3}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return (predicate.evaluate(with: self))
    }
    
    var alphaSpecialCharValidation: Bool {
        let regex = ".*[^A-Za-z_.#@& ].*"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return (predicate.evaluate(with: self))
    }
    
    var alphaCharWithSpaceValidation: Bool {
        let regex = ".*[^A-Za-z ].*"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return (predicate.evaluate(with: self))
    }
    
    var passwordValidation: Bool {
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~_`#?{}()+!@$%^&*-]).{8,16}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    var passwordValidation1: Bool {
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[~_`#?{}()+!@$%^&*-]).{8,16}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    var PhoneNumberValidation: Bool {
        let regex = "^[0-9()-]{9,13}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    var PhoneNumberValidation1: Bool {
        let regex = "^[0-9()-]{0,15}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    var zipCodeValidation: Bool{
        let zipCode = "^\\d{3} \\d{2}$"
        let zipCodePredicate = NSPredicate.init(format: "SELF MATCHES %@", zipCode)
        return zipCodePredicate.evaluate(with: self)
    }
    
    func isValidDouble(_ maxDecimalPlaces: Int) -> Bool {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true 
        let decimalSeparator = formatter.decimalSeparator ?? "."
        if formatter.number(from: self) != nil {
            let split = self.components(separatedBy: decimalSeparator)
            let digits = split.count == 2 ? split.last ?? "" : ""
            
            return digits.count <= maxDecimalPlaces
        }
        return false
    }
    
    var replaceComma: String {
        var replaceValue:String = self
        replaceValue = replaceValue.replacingOccurrences(of: ",", with: ".")
        return replaceValue
    }
    
    var replaceDot: String {
        var replaceValue:String = self
        replaceValue = replaceValue.replacingOccurrences(of: ".", with: ",")
        return replaceValue
    }
    
    var isEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 ? false:true
    }
    
    var toData: Data {
        return Data(self.utf8)
    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}

func setLocalizeText(_ text:String)-> String {
    return NSLocalizedString(text, comment: text)
}
