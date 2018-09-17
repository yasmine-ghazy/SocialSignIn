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
class SignInVC: UIViewController{
    
    //MARK: Properties
    var instagramLogin: InstagramLoginViewController!
    
    lazy var facebookLoginBtn: UIButton = {
        var button = UIButton()
        //button.backgroundColor = .gray
        button.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        //button.imageView?.contentMode = .scaleToFill
        return button
    }()

    lazy var googleLoginBtn: UIButton = {
        let button = UIButton()
        GIDSignIn.sharedInstance().uiDelegate = self
        //button.backgroundColor = .gray
        button.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        //button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var linkedInLoginBtn: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .gray
        button.setImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
        //button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    lazy var instagramLoginBtn: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .gray
        button.setImage(#imageLiteral(resourceName: "instagram"), for: .normal)
       // button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var twitterLoginBtn: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .gray
        button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        //button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    
    
    lazy var stackView: UIStackView = {
        
        let s = UIStackView(frame: self.view.bounds)
        //s.backgroundColor = UIColor.blue
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10//20
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
        
    }()
    
    lazy var container: UIView = {
        let v = UIView()
        //v.backgroundColor = UIColor.black
        return v
    }()
  
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        
        self.view.backgroundColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        
        
        //Adding view components
        view.addSubview(container)
        container.addSubview(stackView)
        
        let buttons: [UIButton] = [ googleLoginBtn, facebookLoginBtn, twitterLoginBtn, linkedInLoginBtn, instagramLoginBtn]
        //let buttons: [UIButton] = [linkedInLoginBtn, instagramLoginBtn]
        
        
        for button in buttons{
            stackView.addArrangedSubview(button)
        }
        
        //Adding view constraints
       
        let stackMargin = 10
        let buttonWidth = (Int(UIScreen.main.bounds.width) - (stackMargin * 6)) / 5
        let stackWidth = buttons.count * buttonWidth
        //let spacingWidth = ((buttons.count - 1) * Int(stackView.spacing))
        //let containerWidth =  buttonsWidth + spacingWidth

        container.snp.makeConstraints { (make) in
            
            make.height.equalTo(buttonWidth)
            make.width.equalTo(stackWidth)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            
            /*
             make.bottom.equalToSuperview().offset(-50)
             make.trailing.equalToSuperview().offset(-30)
             make.leading.equalToSuperview().offset(30)
             make.height.equalToSuperview().offset(40)
             */
        }
 
        
        /*
        let buttonsCount = buttons.count * 40
        let spacingCount = (buttons.count - 1) * Int(stackView.spacing)
        let containerWidth = buttonsCount + spacingCount
        
        container.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(containerWidth)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        */
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        
        //Adding login buttons action
        googleLoginBtn.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
        facebookLoginBtn.addTarget(self, action: #selector(fbLogin), for: .touchUpInside)
        linkedInLoginBtn.addTarget(self, action: #selector(liLoginBtnclicked), for: .touchUpInside)
        instagramLoginBtn.addTarget(self, action: #selector(instaLoginBtnClicked), for: .touchUpInside)
        twitterLoginBtn.addTarget(self, action: #selector(twitterLogin), for: .touchUpInside)
    }
}

//MARK: - GIDSignInUIDelegate
extension SignInVC{
    @objc func googleLogin(){
        print("Google signIn Pressed")
        GIDSignIn.sharedInstance().signIn()
        
    }
}
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
    
    @objc func fbLogin() {
        let login = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["email"], from: self) { ( result, error) in
            if error != nil{
                print(error?.localizedDescription)
                
            }else if (result?.isCancelled)!{
                print("User Canceled")
                self.fbLogin()
                
            }else{
                print("User LoggedIn")
                // Perform any operations on signed in user here.
                var access_token = result?.token.tokenString
            }
        }
    }
}

///LinkedIn login
extension SignInVC{
    
    @objc func liLoginBtnclicked(){
        
        
        
        let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "773ed7ltg76dyf", clientSecret: "6PQF5XYK59qPvrJq", state: "DLKDJF45DIWOERCM", permissions: ["r_emailaddress", "r_basicprofile"], redirectUrl: "https://www.linkedin.com/developer/apps/5241843/auth/linkedin/callback"))
        
        
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,email-address)?format=json",
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
        instagramLogin = InstagramLoginViewController(clientId: API.Insta_clientID, redirectUri: API.Insta_redirectURI)
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


extension SignInVC{
    @objc func twitterLogin(){
        TWTRTwitter.sharedInstance().logIn {
            (session, error) -> Void in
            if (session != nil) {
                print("signed in as \(session?.userName)")
                print(session?.authToken)
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
