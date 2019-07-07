//
//  SignInVC.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/04.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var eMailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func signInButton(_ sender: Any) {
        
        AWSMobileClient.sharedInstance().signIn(username: eMailText.text!, password: passwordText.text!) { (signInResult, error) in
            DispatchQueue.main.async(execute: {
                if let error = error  {
                    print("\(error.localizedDescription)")
                    
                    let signInAlertController = UIAlertController(title: "Password uncorrect",
                                                                   message: "Check out your password.",
                                                                   preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    signInAlertController.addAction(okAction)
                    self.present(signInAlertController, animated: true, completion:  nil)
                    return
                    
                } else if let signInResult = signInResult {
                    switch (signInResult.signInState) {
                    case .signedIn:
                        print("User is signed in.")
                        self.performSegue(withIdentifier: "goSignInOKSegue", sender: nil)
                    //case .smsMFA:
                        //print("SMS message sent to \(signInResult.codeDetails!.destination!)")
                    default:
                        print("Sign In needs info which is not et supported.")
                    }
                }
            })
        }
        
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "goSignUpSegue", sender: nil)
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
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
