//
//  ForgetPasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

import UIKit

///This class handle user forget password process by entering new password, confirm password fields and press reset button
class ForgetPasswordResetVC: UIViewController {
    
    //MARK: - Properties
    var layout: ForgetPasswordResetLayout!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Colors.setPalete(palete: .second)
        // Do any additional setup after loading the view.
        print("Forget password vc is loaded")
        
        //Customize navigatin bar
        self.navigationItem.title = "forget_password".localized()
        
        //Setting Layout
        self.layout = ForgetPasswordResetLayout(superview: self.view)
        layout.setupView()
        
    }
    
}


