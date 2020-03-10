//
//  ViewController.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTextfield()
    }
    
    func setupTextfield() {
        self.setTextfeild(imageName: "ic_user", textField: usernameTextField, placeHolder: "Username")
        self.setTextfeild(imageName: "ic_password", textField: passwordTextField, placeHolder: "Password")
    }
    
    @IBAction func logginDidTap() {
        self.view.endEditing(true)
        guard let username = usernameTextField.text, !username.isEmpty else {
            self.alertMessage("กรุณากรอกข้อมูลให้ครบถ้วน")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            self.alertMessage("กรุณากรอกข้อมูลให้ครบถ้วน")
            return
        }
        
        signInWithUsername(username, password: password, completion: { ( result ) in
            if result {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboradViewController") as! DashboradViewController
                self.present(vc, animated: true, completion: nil)
            }
        }) { (error) in
            self.alertMessage(error.localizedDescription)
        }
    }
    
    func signInWithUsername(_ username: String, password: String, completion: @escaping (_ success: Bool) -> (), failure: @escaping (_ error: Error) -> ()) {
   
        AF.request("/login", method: .post, parameters: ["username":username,"password":password]).response { response in
            debugPrint(response)
            if response.error != nil {
                completion(false)
                failure(response.error!)
            }
            guard let data = response.data else { return }
            let user = try! JSONDecoder().decode(UserModel.self, from: data)
            debugPrint(user)
            
            completion(true)
            
            // save to database
            UserModel.save(user)
        }
    }

}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
