//
//  LoginVC.swift
//  Event Management
//
//  Created by Jaymin on 20/03/25.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var txtEmail: UCTextField!
    @IBOutlet weak var txtPassword: UCTextField!
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var lblSignUp: UILabel!
    
    //MARK: - Variable
    var strTextFieldSelected = ""
    var isCheck = false
    let userEmail = "jaymin12@gmail.com"
    let userPass = "Test@123"
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
    }
    
    
    //MARK: - Setup
    func setup()  {
        let tapSingUp = UITapGestureRecognizer(target: self, action: #selector(tapOnSingup))
        tapSingUp.numberOfTapsRequired = 1
        lblSignUp.isUserInteractionEnabled = true
        lblSignUp.addGestureRecognizer(tapSingUp)
        
        let Account = "Don't have an account?"
        let SingUp = " Sign Up"
        
        let textFilter =  Account +  SingUp
        
        self.lblSignUp.font = UIFont(name: ThemeFont.REGULAR, size: 15 * DeviceScale.SCALE_Y)
        self.lblSignUp.textColor = ThemeColor.ThemeBlack
        let exAttriString = NSMutableAttributedString(string: textFilter)
        let att2    = [NSAttributedString.Key.foregroundColor : ThemeColor.ThemeLightBlue, NSAttributedString.Key.font:UIFont(name: ThemeFont.BOLD, size: 15 * DeviceScale.SCALE_Y) as Any] as [NSAttributedString.Key : Any];
        
        let rangeEx1 = (textFilter as NSString).range(of: SingUp)
        exAttriString.addAttributes(att2 , range: rangeEx1)
        lblSignUp.attributedText = exAttriString
        
    }
    
    
    //MARK: - Button Acction
    @objc func tapOnSingup() {
        let initVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(initVC, animated: true)
    }
    
    @IBAction func btnForgotPass(_ sender: Any) {
        let initVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(initVC, animated: true)
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
    
    
    @IBAction func btnLogin(_ sender: Any) {
        
        let messge = LoginMainViewModel.shared.validate(user: txtEmail.text!, pass: txtPassword.text!)
        if messge.length > 0 {
            appDelegateShared.showToast(message: messge)
        }else {
            
            if txtEmail.text == userEmail && txtPassword.text == userPass  {
                let initVC = UIStoryboard(name: "Event", bundle: nil).instantiateViewController(withIdentifier: "EventVC") as! EventVC
                self.navigationController?.pushViewController(initVC, animated: true)
            }else{
                appDelegateShared.showToast(message: "Email or password does not match.")
            }
        }
    }
}

//MARK: UITextFieldDelegate
extension LoginVC:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            strTextFieldSelected = "txtUsername"
            
        }else if textField == txtPassword {
            strTextFieldSelected = "txtPassword"
        }
        
        textField.inputAccessoryView = toolbarInit()
        return true
    }
    
    //MARK: UITextField Toolbar and Methods
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
            
            prevNextSegment.setTitleTextAttributes([NSAttributedString.Key.font: barbuttonFont, NSAttributedString.Key.foregroundColor:ThemeColor.ThemeBlack], for: .disabled)
        }
        
        prevNextSegment.insertSegment(withTitle:"Prev", at: 0, animated: false)
        prevNextSegment.insertSegment(withTitle:"Next", at: 1, animated: false)
        
        prevNextSegment.addTarget(self, action: #selector(prevOrNext), for: UIControl.Event.valueChanged)
        return prevNextSegment;
    }
    
    @objc func prevOrNext(_ segm: UISegmentedControl) {
        if (segm.selectedSegmentIndex == 1){
            if (strTextFieldSelected == "txtUsername"){
                txtEmail.resignFirstResponder()
                txtPassword.becomeFirstResponder()
            }
            
        }
        else{
            if (strTextFieldSelected == "txtPassword"){
                txtPassword.resignFirstResponder()
                txtEmail.becomeFirstResponder()
            }
        }
    }
    
    @objc func resignKeyboard() {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
}
