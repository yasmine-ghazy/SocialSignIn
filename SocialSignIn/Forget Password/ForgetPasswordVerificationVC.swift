//
//  ForgetPasswordVerificationVC.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

///This class handle user forget password process by enter verification code that delivered in email message
class ForgetPasswordVerificationVC: UIViewController {
    
    //MARK: - Properties
    var layout: ForgetPasswordVerificationLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Layout
        Colors.setPalete(palete: .second)
        layout = ForgetPasswordVerificationLayout(superview: self.view)
        layout.setupView()
        
        //Customize navigatin bar
        self.navigationItem.title = "forget_password".localized()
        
        //add target
        layout.ConfirmCodeBtn.addTarget(self, action: #selector(confirmCode), for: .touchUpInside)
        
    }
    
    
}
//MARK: - Methods
extension ForgetPasswordVerificationVC{
    
    /**
     This function is the selector for verifyCodeBtn target
     it handles navigation to ForgetPasswordResetVC
     */
    @objc func confirmCode(){
        let vc = ForgetPasswordResetVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
