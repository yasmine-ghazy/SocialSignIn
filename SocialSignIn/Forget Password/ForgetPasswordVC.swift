//
//  ForgetPasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    
    //MARK: Properties
    var layout: ForgetPasswordLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Customize navigatin bar
        
        self.navigationItem.title = "forget_password".localized()
        
    self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //Setting Layout
        self.layout = ForgetPasswordLayout(superview: self.view)
        layout.setupView()
        
        //add target
        layout.resetPasswordBtn.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
    }
    
}

extension ForgetPasswordVC{
    @objc func reset(){
        let vc = ForgetPasswordVerificationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
