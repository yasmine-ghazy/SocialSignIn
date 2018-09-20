//
//  ChangePasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController{

    //MARK: Properties
    var layout: ChangePasswordLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Change password vc is loaded")
        
        //Customize navigatin bar
        
        self.title = "change_password".localized()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //Setting Layout
        self.layout = ChangePasswordLayout(superview: self.view)
        layout.setupView()
        
    }


}
