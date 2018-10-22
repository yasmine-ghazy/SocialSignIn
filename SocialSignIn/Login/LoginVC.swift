//
//  ViewController.swift
//  SocialSignIn
//
//  Created by apple on 8/19/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

//MARK: - Import Frameworks
import UIKit
import InstagramLogin
import Material

///This viewController is the main screen for the app that handle user login with normal account or social account
class LoginVC: UIViewController{
    
    // MARK: Properties
    var layout: LoginLayout!
    var presenter: LoginPresenter!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initializing Layout object
        Colors.setPalete(palete: .main)
        layout = LoginLayout(superview: self.view)
        layout.setupView()
        
        //Initialize Presenter object
        presenter = LoginPresenter()
        presenter.setView(view: self)
        
        //Adding login buttons action
        layout.googleLoginBtn.addTarget(self, action: #selector(googleLogin) , for: .touchUpInside)
        layout.facebookLoginBtn.addTarget(self, action: #selector(facebookLogin) , for: .touchUpInside)
        layout.linkedInLoginBtn.addTarget(self, action: #selector(linkedinLogin) , for: .touchUpInside)
        layout.instagramLoginBtn.addTarget(self, action: #selector(instagramLogin), for: .touchUpInside)
        layout.twitterLoginBtn.addTarget(self, action: #selector(twitterLogin), for: .touchUpInside)
        
        //Adding tapGesture on label (forgetPassword)
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(self.forgetPasswordTapped))
        tapGestureRecognizer1.numberOfTapsRequired = 1
        layout.forgetPasswordLbl.addGestureRecognizer(tapGestureRecognizer1)
        layout.forgetPasswordLbl.isUserInteractionEnabled = true
        
        //Adding tapGesture on label (register)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(self.changePasswordTapped))
        tapGestureRecognizer2.numberOfTapsRequired = 1
        layout.registerLbl.addGestureRecognizer(tapGestureRecognizer2)
        layout.registerLbl.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Hide Navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}

// MARK: Navigation Methods
extension LoginVC{
    
    ///This function is the selector for forgetPasswordLbl tabGesture, it handles navigation to ForgetPasswordVC
    @objc func forgetPasswordTapped(){
        let vc = ForgetPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    ///This function is the selector for changePasswordLbl tabGesture, it handles navigation to ChangePasswordVC
    @objc func changePasswordTapped(){
        let vc = ChangePasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: Social Login Buttons Methods
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

// MARK: - Conforming to SocialAuthView Methods
extension LoginVC: LoginView{
    func presentInsta(instagramLogin: InstagramLoginViewController) {
        present(instagramLogin, animated: true, completion: nil)
    }
    
    func setUserToken(token: String) {
        print("User Token : ", token)
    }
}

// MARK: - Conforming to TextFieldDelegte Methods
extension ForgetPasswordResetVC: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
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
