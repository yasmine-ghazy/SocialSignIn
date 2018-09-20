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
    var layout: ForgetPasswordLayout_Reset!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Forget password vs is loaded")
        
        //Customize navigatin bar
        
        self.title = "Forget Password"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backItem?.title = "Back"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        
        //Setting Layout
        self.layout = ForgetPasswordLayout_Reset(superview: self.view)
        layout.setupView()
        
    }

}


