//
//  ForgetPasswordVerificationVC.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class ForgetPasswordVerificationVC: UIViewController {

    //MARK: Properties
    var layout: ForgetPasswordVerificationLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Forget password vs is loaded")
        
        //Customize navigatin bar
        
        self.navigationItem.title = "forget_password".localized()
     
        //Setting Layout
        layout = ForgetPasswordVerificationLayout(superview: self.view)
        layout.setupView()
        
        //add target
        layout.ConfirmCodeBtn.addTarget(self, action: #selector(confirmCode), for: .touchUpInside)
        
    }


}

extension ForgetPasswordVerificationVC{
    @objc func confirmCode(){
        let vc = ForgetPasswordResetVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
