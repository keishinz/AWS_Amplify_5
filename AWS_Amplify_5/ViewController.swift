//
//  ViewController.swift
//  AWS_Amplify_5
//
//  Created by 張 渓岑 on 2019/07/04.
//  Copyright © 2019 kschou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signInPageButton(_ sender: Any) {
        performSegue(withIdentifier: "goSignInSegue", sender: nil)
    }
    
    
}

