//
//  ViewController.swift
//  SocialSignIn
//
//  Created by apple on 8/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//MARK: - Import Frameworks
import UIKit
import GoogleSignIn
import FBSDKLoginKit
import SnapKit

///Sgign In view controller
class ViewController: UIViewController{
    
    //MARK: Properties
    lazy var fbLoginBtn: FBSDKLoginButton = {
        let fbBtn = FBSDKLoginButton()
        return fbBtn
    }()
    
    lazy var googleLoginBtn: GIDSignInButton = {
        return GIDSignInButton()
    }()
    
    lazy var stackView: UIStackView = {
        
        let s = UIStackView(frame: self.view.bounds)
        s.axis = .vertical
        s.distribution = .fillEqually
        // s.alignment = .fill
        s.spacing = 100
        //s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        s.addArrangedSubview(googleLoginBtn)
        s.addArrangedSubview(fbLoginBtn)
        return s
        
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        
        GIDSignIn.sharedInstance().uiDelegate = self
        fbLoginBtn.delegate = self
        fbLoginBtn.readPermissions = ["email"]
        if FBSDKAccessToken.current != nil{
            print("logged In")
        }else{
            print("not logged In")
        }
        
        view.addSubview(stackView)
        
        googleLoginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - GIDSignInUIDelegate
extension ViewController : GIDSignInUIDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("signIn pressed")
        if let error = error {
            print("\(error.localizedDescription)")
            print("error in sign in")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
            print(fullName)
            print(email)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print("log out from goolgle")
    }
}

//MARK: - FBSDKLoginButtonDelegate
extension ViewController: FBSDKLoginButtonDelegate{
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error.localizedDescription)
            
        }else if result.isCancelled{
            print("User Canceled")
            
        }else{
            
            print("User LoggedIn")
            
            // Perform any operations on signed in user here.
            print("token: \(result.token.tokenString)")
            print("user_id: \(result.token.userID)")
            returnUserData(userID: result.token.userID)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user Logged out")
    }
    
    func returnUserData(userID: String)
    {
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                }else{
                    print("the access token is \(FBSDKAccessToken.current().tokenString)")
                    
                    var accessToken = FBSDKAccessToken.current().tokenString
                    
                    var facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
                    
                    print("fetched user: \(result)")
                    
                }
            })
        }
    }
    
}

