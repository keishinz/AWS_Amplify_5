//
//  SignUpVC.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/04.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //eMailText.delegate = self
        //usernameText.delegate = self
        //passwordText.delegate = self
        //passwordComfirmText.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var eMailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordComfirmText: UITextField!
    
    //var textTrans: String?
    
    @IBAction func signUpButton(_ sender: Any) {
        
        /*
        guard let eMailValue = self.eMailText.text, !eMailValue.isEmpty,
            let userNameValue = self.usernameText.text, !userNameValue.isEmpty,
            let passwordValue = self.passwordText.text, !passwordValue.isEmpty,
            let passwordComfirmValue = self.passwordComfirmText.text, !passwordComfirmValue.isEmpty else {
                let emptyAlertController = UIAlertController(title: "Missing Required Fields",
                                                        message: "Username / Password are required for registration.",
                                                        preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                emptyAlertController.addAction(okAction)
                
                self.present(emptyAlertController, animated: true, completion:  nil)
                return
        }
        
        guard passwordValue == passwordComfirmValue else {
            let unequalAlertController = UIAlertController(title: "Password Error",
                                                    message: "Password is not the same.",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            unequalAlertController.addAction(okAction)
            
            self.present(unequalAlertController, animated: true, completion:  nil)
            return
        }
        */
        
        AWSMobileClient.sharedInstance().signUp(username: usernameText.text!,
                                                password: passwordText.text!,
                                                userAttributes: ["email":eMailText.text!]) { (signUpResult, error) in
                                                    DispatchQueue.main.async(execute: {
                                                        if let error = error {
                                                            if let error = error as? AWSMobileClientError {
                                                                switch(error) {
                                                                case .usernameExists(let message):
                                                                    print(message)
                                                                default:
                                                                    break
                                                                }
                                                            }
                                                            print("\(error.localizedDescription)")
                                                        } else if let signUpResult = signUpResult {
                                                            if signUpResult.signUpConfirmationState != .confirmed {
                                                                self.performSegue(withIdentifier: "goConfirm", sender: nil)
                                                            } //else {
                                                                //let _ = self.navigationController?.popToRootViewController(animated: true)
                                                            //}
                                                        }
                                                    })
                                                    
                                                    //else {
                                                        //self.performSegue(withIdentifier: "goSignUpComfirmCodeSegue", sender: nil)
                                                    //}
                                                    
                                                    
                                                    
                                                    /*
                                                    if let signUpResult = signUpResult {
                                                        switch(signUpResult.signUpConfirmationState) {
                                                            case .confirmed:
                                                                print("User is signed up and confirmed.")
                                                            
                                                            case .unconfirmed:
                                                                //self.performSegue(withIdentifier: "goSignUpComfirmCodeSegue", sender: self.eMailText)
                                                                print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                                                            
                                                            case .unknown:
                                                                print("Unexpected case")
                                                        }
                                                        //self.performSegue(withIdentifier: "goSignUpComfirmCodeSegue", sender: nil)
                                                    } else if let error = error {
                                                        if let error = error as? AWSMobileClientError {
                                                            switch(error) {
                                                            case .usernameExists(let message):
                                                                print(message)
                                                            default:
                                                                break
                                                            }
                                                        }
                                                        print("\(error.localizedDescription)")
                                                    }
                                                    */
                                                    
        }
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SignUpComfirmCodeVC
        //nextVC.eMailTrans = eMailText.text
        nextVC.eMailTrans = sender as? String
    }
    */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
