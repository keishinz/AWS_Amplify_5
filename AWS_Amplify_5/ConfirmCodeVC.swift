//
//  ConfirmCodeVC.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/06.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit
import AWSMobileClient

class ConfirmCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eMailTrans.text = eMailText

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var eMailTrans: UILabel!
    var eMailText: String!
    
    @IBOutlet weak var confirmCodeField: UITextField!
    @IBAction func confirmCodeButton(_ sender: Any) {
        AWSMobileClient.sharedInstance().confirmSignUp(username: eMailText, confirmationCode: confirmCodeField.text!) { (signUpResult, error) in
            DispatchQueue.main.async(execute: {
                if let signUpResult = signUpResult {
                    if signUpResult.signUpConfirmationState == .confirmed {
                        self.performSegue(withIdentifier: "goSignUpOKSegue", sender: nil)
                    } else {
                        print("Unexpected case")
                    }
                } else if let error = error {
                    
                    let confirmationErrorAlertController = UIAlertController(title: "Confirmation Error", message: "Check the code again or try to resend another code", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    confirmationErrorAlertController.addAction(defaultAction)
                    self.present(confirmationErrorAlertController, animated: true, completion: nil)
                    
                    print("\(error.localizedDescription)")
                }
            })
            /*
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState) {
                case .confirmed:
                    print("User is signed up and confirmed.")
                    self.performSegue(withIdentifier: "goSignUpOKSegue", sender: nil)
                case .unconfirmed:
                    print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                case .unknown:
                    print("Unexpected case")
                }
            } else if let error = error {
                print("\(error.localizedDescription)")
            }
            */
            
        }
    }
    
    @IBAction func resenCodeButton(_ sender: Any) {
        AWSMobileClient.sharedInstance().resendSignUpCode(username: eMailText, completionHandler: { (result, error) in
            DispatchQueue.main.async(execute: {
                if let signUpResult = result {
                    
                    let checkEmailAlertController = UIAlertController(title: "Check your email", message: "A new code has been send", preferredStyle: .actionSheet)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    checkEmailAlertController.addAction(defaultAction)
                    self.present(checkEmailAlertController, animated: true, completion: nil)
                    
                    print("A verification code has been sent via \(signUpResult.codeDeliveryDetails!.deliveryMedium) at \(signUpResult.codeDeliveryDetails!.destination!)")
                    
                } else if let error = error {
                    print("\(error.localizedDescription)")
                }
            })
        })
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
