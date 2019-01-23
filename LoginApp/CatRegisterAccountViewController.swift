//
//  CatRegisterAccountViewController.swift
//  LoginApp
//
//  Created by Artem Karmaz on 1/23/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class CatRegisterAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
        {nc in self.view.frame.origin.y = -200}
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
        {nc in self.view.frame.origin.y = 0}
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerCatAccountButton(_ sender: UIButton) {
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CatRegisterAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField || textField == passwordTextField {
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }
        

        return true
    }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            if String.matches("^[a-zA-Z0-9._-]{1,30}$") {
                print("Check imput")
            }
    }
    
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
