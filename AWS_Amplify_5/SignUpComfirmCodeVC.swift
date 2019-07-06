//
//  SignUpComfirmCodeVC.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/06.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignUpComfirmCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //eMailLabel.text = eMailTrans!

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var eMailLabel: UILabel!
    
    //var eMailTrans: String?
    
    @IBOutlet weak var signUpComfirmCodeText: UITextField!
    @IBAction func signUpComfirmCodeButton(_ sender: Any) {
        
        /*
        AWSMobileClient.sharedInstance().confirmSignUp(username: eMailTrans!, confirmationCode: signUpComfirmCodeText.text!) { (signUpResult, error) in
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState) {
                case .confirmed:
                    print("User is signed up and confirmed.")
                    self.performSegue(withIdentifier: "goSignUpFinishedSegue", sender: nil)
                case .unconfirmed:
                    print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                case .unknown:
                    print("Unexpected case")
                }
            } else if let error = error {
                print("\(error.localizedDescription)")
            }
        }
        */
        
    }
    
    @IBAction func resendComfirmCodeButton(_ sender: Any) {
        
        /*
        AWSMobileClient.sharedInstance().resendSignUpCode(username: eMailTrans!, completionHandler: { (result, error) in
            if let signUpResult = result {
                print("A verification code has been sent via \(signUpResult.codeDeliveryDetails!.deliveryMedium) at \(signUpResult.codeDeliveryDetails!.destination!)")
            } else if let error = error {
                print("\(error.localizedDescription)")
            }
        })
        */
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
