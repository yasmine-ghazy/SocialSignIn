//
//  ViewController.swift
//  SocialSignIn
//
//  Created by apple on 8/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//MARK: - Import Frameworks
import UIKit
import SnapKit
import GoogleSignIn
import FBSDKLoginKit
import LinkedinSwift
import InstagramLogin
import TwitterKit

///Sign In view controller
class SocialAuthVC: UIViewController{
    
    //MARK: Properties
    
    var layout: SocialAuthLayout!
    var presenter: SocialAuthPresenter!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Layout
        //layout = SocialAuthLayout(superview: self.view, socialAuthDelegate: self )
        layout = SocialAuthLayout(superview: self.view)
        layout.setupView()
        
        //Setting Presenter
        presenter = SocialAuthPresenter()
        presenter.setView(view: self)
        
        //Adding login buttons action
        layout.googleLoginBtn.addTarget(self, action: #selector(googleLogin) , for: .touchUpInside)
        //GIDSignIn.sharedInstance().uiDelegate = self
        layout.facebookLoginBtn.addTarget(self, action: #selector(facebookLogin) , for: .touchUpInside)
        layout.linkedInLoginBtn.addTarget(self, action: #selector(linkedinLogin) , for: .touchUpInside)
        layout.instagramLoginBtn.addTarget(self, action: #selector(instagramLogin), for: .touchUpInside)
        layout.twitterLoginBtn.addTarget(self, action: #selector(twitterLogin), for: .touchUpInside)
        
    }

}

extension SocialAuthVC{
    
    @objc func googleLogin() {
        print("Google signIn Pressed")
        presenter.gLogin()
        
    }
    
    @objc func facebookLogin() {
        print("Facebook signIn Pressed")
        presenter.fbLogin()
    }
    
    @objc func twitterLogin() {
        print("Twitter signIn Pressed")
        presenter.twtrLogin()
    }
    
    @objc func linkedinLogin() {
        print("Linkedin signIn pressed")
        presenter.liLoginBtnclicked()
    }
    
    @objc func instagramLogin() {
        print("Instagram signIn Pressed")
        presenter.loginWithInstagram()
    }
    
}

extension SocialAuthVC: SocialAuthView{
    func presentInsta(instagramLogin: InstagramLoginViewController) {
        present(instagramLogin, animated: true, completion: nil)
    }
    
    func setUserToken(token: String) {
        print("User Token : ", token)
    }
}
/*
extension SocialAuthVC: SocialAuthDelegate{
    
}
*/
