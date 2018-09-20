//
//  ForgetPasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class ForgetPasswordResetVC: UIViewController {

    //MARK: Properties
    var layout: ForgetPasswordResetLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Forget password vc is loaded")
        
        //Customize navigatin bar
        self.navigationItem.title = "forget_password".localized()

        //Setting Layout
        self.layout = ForgetPasswordResetLayout(superview: self.view)
        layout.setupView()
        
    }

}


