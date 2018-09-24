//
//  ForgetPasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

///This class handle user Forget password process by entering user email and pressing confirm
class ForgetPasswordVC: UIViewController {
    
    //MARK: Properties
    var layout: ForgetPasswordLayout!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initialize Layout
        Colors.setPalete(palete: .second)
        self.layout = ForgetPasswordLayout(superview: self.view)
        layout.setupView()
        
        //Customize navigatin bar
        self.navigationItem.title = "forget_password".localized()
        
        //add target
        layout.resetPasswordBtn.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
    }
    
}

//MARK: - Methods
extension ForgetPasswordVC{
    /**
     This function is the selector for resetBtn target
     it handles navigation to ForgetPasswordVerificationVC
     */
    @objc func reset(){
        let vc = ForgetPasswordVerificationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
