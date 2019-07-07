//
//  SignInFinishedVC.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/04.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit
import AWSMobileClient

class SignInFinishedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    @IBOutlet weak var signInFinishedLabel: UILabel!
    @IBAction func signOutButton(_ sender: Any) {
        AWSMobileClient.sharedInstance().signOut()
        
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState {
                switch(userState){
                case .signedIn:
                    DispatchQueue.main.async {
                        print("For some reason, you can't sign out.lol")
                    }
                case .signedOut:
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "signOutSegue2", sender: nil)
                    }
                default:
                    break
                }
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
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
