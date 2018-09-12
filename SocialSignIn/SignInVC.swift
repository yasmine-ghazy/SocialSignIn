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
import LinkedinSwift
import InstagramLogin

///Sign In view controller
class SignInVC: UIViewController{
    
    //MARK: Properties
    var instagramLogin: InstagramLoginViewController!
 
  
    lazy var fbLoginBtn: FBSDKLoginButton = {
        let fbBtn = FBSDKLoginButton()
        return fbBtn
    }()
    
    lazy var googleLoginBtn: GIDSignInButton = {
        return GIDSignInButton()
    }()
    
    lazy var linkedInLoginBtn: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Login with LinkedIn"
        button.titleLabel?.textColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "San Francisco", size: 16)
        button.backgroundColor = UIColor.blue
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        return button
    }()
    
    lazy var instagramLoginBtn: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Login with Instgram"
        button.titleLabel?.textColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "San Francisco", size: 16)
        button.backgroundColor = UIColor.purple
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        return button
    }()
    
    
    
    lazy var stackView: UIStackView = {
        
        let s = UIStackView(frame: self.view.bounds)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        //s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        s.addArrangedSubview(googleLoginBtn)
        s.addArrangedSubview(fbLoginBtn)
        s.addArrangedSubview(linkedInLoginBtn)
        s.addArrangedSubview(instagramLoginBtn)
        return s
        
    }()
    
  
    
    
    let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "773ed7ltg76dyf", clientSecret: "6PQF5XYK59qPvrJq", state: "DLKDJF45DIWOERCM", permissions: ["r_emailaddress", "r_basicprofile"], redirectUrl: "https://www.linkedin.com/developer/apps/5241843/auth/linkedin/callback"))
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        
        GIDSignIn.sharedInstance().uiDelegate = self
        fbLoginBtn.delegate = self
        fbLoginBtn.readPermissions = ["email"]
        if FBSDKAccessToken.currentAccessTokenIsActive(){
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
            make.top.bottom.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(100)
        }
        
        
        
        linkedInLoginBtn.addTarget(self, action: #selector(liLoginBtnclicked), for: .touchUpInside)
        instagramLoginBtn.addTarget(self, action: #selector(instaLoginBtnClicked), for: .touchUpInside)
    }
}

//MARK: - GIDSignInUIDelegate
extension SignInVC : GIDSignInUIDelegate{
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
        print("log out from google")
    }
}

//MARK: - FBSDKLoginButtonDelegate
extension SignInVC: FBSDKLoginButtonDelegate{
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
            returnUserData(userID: result.token.userID){(name, email) in
                print(name)
                print(email)
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user Logged out")
    }
    
    func returnUserData(userID: String, completion: @escaping (_ name: String, _ email: String)-> Void)
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
                    
                    if let dictionary = result as? [String: Any] {
                        if let email = dictionary["email"] as? String , let name = dictionary["name"] as? String {
                            // access individual value in dictionary
                            completion(name, email)
                        }
                        
                    }
                    
                }
            })
        }
    }
    
}

///LinkedIn login
extension SignInVC{
    
    @objc func liLoginBtnclicked(){
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            self.linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,email-address)?format=json",
                                           requestType: LinkedinSwiftRequestGet,
                                           success: { (response) -> Void in
                                            
                                            //Request success response
                                            print(response)
                                            
                                            
            }) { [unowned self] (error) -> Void in
                
                //Encounter error
            }
        }, error: { (error) -> Void in
            //Encounter error: error.localizedDescription
        }, cancel: { () -> Void in
            //User Cancelled!
        })
    }
    
}

///Instagram Login
extension SignInVC{
    
    @objc func instaLoginBtnClicked(){
        print("Insta clicked")
        loginWithInstagram()
    }
}



extension SignInVC {

    func loginWithInstagram() {
        
        // 2. Initialize your 'InstagramLoginViewController' and set your 'ViewController' to delegate it
        instagramLogin = InstagramLoginViewController(clientId: API.clientID, redirectUri: API.redirectURI)
        instagramLogin.delegate = self
        
        // 3. Customize it
        instagramLogin.scopes = [.basic, .publicContent] // [.basic] by default; [.all] to set all permissions
        instagramLogin.title = "Instagram" // If you don't specify it, the website title will be showed
        instagramLogin.progressViewTintColor = .blue // #E1306C by default
        
        // If you want a .stop (or other) UIBarButtonItem on the left of the view controller
        instagramLogin.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissLoginViewController))
        
        // You could also add a refresh UIBarButtonItem on the right
        instagramLogin.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage))
        
        // 4. Present it inside a UINavigationController (for example)
        present(UINavigationController(rootViewController: instagramLogin), animated: true)
    }
    
    @objc func dismissLoginViewController() {
        instagramLogin.dismiss(animated: true)
    }
    
    @objc func refreshPage() {
        instagramLogin.reloadPage()
    }

}

extension SignInVC: InstagramLoginViewControllerDelegate {
    
    func instagramLoginDidFinish(accessToken: String?, error: InstagramError?) {
        
        // Whatever you want to do ...
        print(accessToken)
        // And don't forget to dismiss the 'InstagramLoginViewController'
        instagramLogin.dismiss(animated: true)
    }
}
