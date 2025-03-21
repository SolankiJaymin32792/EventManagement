//
//  Untitled.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import Foundation
import UIKit

//MARK: - SITextField
class UCTextField: UITextField
{
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) || action == #selector(UIResponderStandardEditActions.select(_:)) || action == #selector(UIResponderStandardEditActions.selectAll(_:)) {
            return true
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    @IBInspectable var postfix : String = ""
    @IBInspectable var removePostfixOnEditing : Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.font = self.font?.withSize((self.font?.pointSize)! * DeviceScale.SCALE_X)
        self.addTarget(self, action: #selector(removePostFix), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textHasChanged), for: .editingChanged)
    }
    
    @objc func textHasChanged()
    {
        self.removePostFix()
        self.addPostFix()
    }
    
    
    func addPostFix()
    {
        if(self.text != nil)
        {
            self.text = postfix + self.text!
        }
    }
    
    func originalText() ->String?{
        let prefixRange = NSString(string: (self.attributedText?.string)!).range(of: postfix)
        if(prefixRange.location != NSNotFound)
        {
            return self.text!.replacingOccurrences(of: postfix, with: "")
        }
        return self.text
    }
    
    @objc func removePostFix(){
        
        if(self.removePostfixOnEditing && self.text != nil)
        {
            self.text = self.originalText()
        }
    }
}
