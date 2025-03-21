//
//  RegisterVC.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

class RegisterVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var txtUserName: UCTextField!
    @IBOutlet weak var txtuserEmail: UCTextField!
    @IBOutlet weak var txtUserPhone: UCTextField!
    @IBOutlet weak var txtPassword: UCTextField!
    @IBOutlet weak var imgCheck: UIImageView!
    
    //MARK: - Variable
    var strTextFieldSelected = ""
    var isCheck = false
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Button Action Event
    
    @IBAction func tapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapOnCheck(_ sender: Any) {
        
        isCheck.toggle()
        
        if isCheck {
            imgCheck.image = UIImage(named: "Eyeshow")
            txtPassword.isSecureTextEntry = false
        } else {
            imgCheck.image = UIImage(named: "Eyehide")
            txtPassword.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func btnSingUp(_ sender: Any) {
        let messge = RegisterViewModel.shared.validate(Username: txtUserName.text!,
                                                       phone: txtUserPhone.text!,
                                                       email: txtuserEmail.text!,
                                                       pass: txtPassword.text!)
        
        if messge.length > 0 {
            appDelegateShared.showToast(message: messge)
        }else {
            let initVC = UIStoryboard(name: "Event", bundle: nil).instantiateViewController(withIdentifier: "EventVC") as! EventVC
            self.navigationController?.pushViewController(initVC, animated: true)
            
        }
    }
}


//MARK: - UITextFieldDelegate
extension RegisterVC:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtUserName {
            strTextFieldSelected = "txtUserName"
            
        }else if textField == txtuserEmail {
            strTextFieldSelected = "txtuserEmail"
            
        }else if textField == txtUserPhone {
            strTextFieldSelected = "txtUserPhone"
        }else if textField == txtPassword {
            strTextFieldSelected = "txtPassword"
        }
        
        textField.inputAccessoryView = toolbarInit()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - UITextField Toolbar and Methods
    func toolbarInit() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44 * DeviceScale.SCALE_Y)
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.barTintColor = ThemeColor.ThemWhite
        toolBar.tintColor = ThemeColor.ThemeLightBlue
        
        let doneButton = UIBarButtonItem(title:"Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(resignKeyboard))
        let previousButton:UIBarButtonItem! = UIBarButtonItem()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        previousButton.customView = self.prevNextSegment()
        toolBar.setItems([previousButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar;
    }
    
    func prevNextSegment() -> UISegmentedControl {
        let prevNextSegment = UISegmentedControl()
        prevNextSegment.frame = CGRect(x: 0, y: 0, width: 130, height: 36 * DeviceScale.SCALE_Y)
        let barbuttonFont = UIFont(name: ThemeFont.REGULAR , size: 15 * DeviceScale.SCALE_Y) ?? UIFont.systemFont(ofSize: 15 * DeviceScale.SCALE_Y)
        
        if #available(iOS 13.0, *) {
            prevNextSegment.backgroundColor = ThemeColor.ThemWhite
            prevNextSegment.layer.borderColor = ThemeColor.ThemeLightBlue.cgColor
            prevNextSegment.selectedSegmentTintColor = ThemeColor.ThemeLightBlue
            prevNextSegment.layer.borderWidth = 1
            
            let titleTextAttributes = [NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor: ThemeColor.ThemeLightBlue]
            prevNextSegment.setTitleTextAttributes(titleTextAttributes, for:.normal)
            
            let titleTextAttributes1 = [NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor: ThemeColor.ThemWhite,NSAttributedString.Key.backgroundColor: ThemeColor.ThemeLightBlue]
            prevNextSegment.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        } else {
            prevNextSegment.isMomentary = true
            prevNextSegment.tintColor = ThemeColor.ThemeLightBlue
            
            prevNextSegment.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:ThemeColor.ThemeLightBlue], for: .disabled)
        }
        
        prevNextSegment.insertSegment(withTitle:"Prev", at: 0, animated: false)
        prevNextSegment.insertSegment(withTitle:"Next", at: 1, animated: false)
        
        prevNextSegment.addTarget(self, action: #selector(prevOrNext), for: UIControl.Event.valueChanged)
        return prevNextSegment;
    }
    
    
    @objc func prevOrNext(_ segm: UISegmentedControl) {
        if (segm.selectedSegmentIndex == 1){
            if (strTextFieldSelected == "txtUserName"){
                txtUserName.resignFirstResponder()
                txtuserEmail.becomeFirstResponder()
            }
            else if (strTextFieldSelected == "txtuserEmail"){
                txtuserEmail.resignFirstResponder()
                txtUserPhone.becomeFirstResponder()
            }else if (strTextFieldSelected == "txtUserPhone"){
                txtUserPhone.resignFirstResponder()
                txtPassword.becomeFirstResponder()
            }
        }
        else{
            if (strTextFieldSelected == "txtPassword"){
                txtPassword.resignFirstResponder()
                txtUserPhone.becomeFirstResponder()
            }
            else if (strTextFieldSelected == "txtUserPhone"){
                txtUserPhone.resignFirstResponder()
                txtuserEmail.becomeFirstResponder()
            }
            else if (strTextFieldSelected == "txtuserEmail"){
                txtuserEmail.resignFirstResponder()
                txtUserName.becomeFirstResponder()
            }
        }
    }
    
    @objc func resignKeyboard() {
        txtUserName.resignFirstResponder()
        txtuserEmail.resignFirstResponder()
        txtUserPhone.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
}


