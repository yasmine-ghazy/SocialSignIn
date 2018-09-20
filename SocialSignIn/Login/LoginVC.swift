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
import Material

///Sign In view controller
class LoginVC: UIViewController{
    
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
        
        
        //Adding tapGesture on labeles (forgetPassword - register)
        var tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(self.forgetPasswordTapped))
        tapGestureRecognizer1.numberOfTapsRequired = 1
        layout.forgetPasswordBtn.addGestureRecognizer(tapGestureRecognizer1)
        layout.forgetPasswordBtn.isUserInteractionEnabled = true
        
        
        
        //Adding tapGesture on labeles (forgetPassword - register)
        var tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(self.changePasswordTapped))
        tapGestureRecognizer2.numberOfTapsRequired = 1
        layout.registerBtn.addGestureRecognizer(tapGestureRecognizer2)
        layout.registerBtn.isUserInteractionEnabled = true
        
        //layout.identityTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Customize Navigatinbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension LoginVC{
    
    @objc func forgetPasswordTapped(){
        let vc = ForgetPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changePasswordTapped(){
        let vc = ChangePasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//Social Login Buttons
extension LoginVC{
    
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

extension LoginVC: SocialAuthView{
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

// MARK: - Conforming to TextFieldDelegte Methods
extension ForgetPasswordResetVC: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        print("Start")
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
