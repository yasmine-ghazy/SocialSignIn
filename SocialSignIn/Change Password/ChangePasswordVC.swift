//
//  ChangePasswordVC.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

///This class handle user changing password process by entering old password, new password, confirm password fields and press reset button
class ChangePasswordVC: UIViewController{
    
    //MARK: Properties
    var layout: ChangePasswordLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initialize Layout object
        Colors.setPalete(palete: .second)
        self.layout = ChangePasswordLayout(superview: self.view)
        layout.setupView()
        
        //Customize navigatin bar
        self.title = "change_password".localized()
    }
    
}
