//
//  SocialAuthPresenter.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//import Frameworks
import Foundation
import GoogleSignIn
import FBSDKLoginKit
import LinkedinSwift
import InstagramLogin
import TwitterKit

///This protocol is implemented in LoginVC to enable LoginPresenter make operations for LoginVC
protocol  LoginView : class{
    func setUserToken(token: String)
    func presentInsta(instagramLogin: InstagramLoginViewController)
}

///This class handles the business logic for LoginVC
class LoginPresenter: NSObject{
    
    // MARK: Properties
    var instaLogin: InstagramLoginViewController!
    fileprivate weak var socialAuthView: LoginView?
    
    // MARK: Initialization
    override init(){
        super.init()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    ///this method initialize the presenter view methods
    func setView(view: LoginView){
        self.socialAuthView = view
    }
    
}

//MARK: - Conform GIDSignInUIDelegate Methods
extension LoginPresenter : GIDSignInUIDelegate, GIDSignInDelegate{
    
    ///This function call signIn() in GIDSignIn which perform google signIn process and send userToken of Google LoggedIn user to LoginVC
    func gLogin(){
        print("Google Login")
        GIDSignIn.sharedInstance().signIn()
    }
    
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
            
            //Sending userToken from to SocialAuthVC
            self.socialAuthView?.setUserToken(token: idToken!)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print("log out from google")
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print("Presented")
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print("Dismissed")
    }
}

//MARK: - Conform FBSDKLoginButtonDelegate Methods
extension LoginPresenter: FBSDKLoginButtonDelegate{
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error.localizedDescription)
            
        }else if result.isCancelled{
            print("User Canceled")
            
        }else{
            
            print("User LoggedIn")
            
            // Perform any operations on signed in user here.
            var userToken = result.token.tokenString
            print("token: \(userToken)")
            print("user_id: \(result.token.userID)")
            returnUserData(userID: result.token.userID){(name, email) in
                print(name)
                print(email)
            }
            //Sending userToken from to SocialAuthVC
            self.socialAuthView?.setUserToken(token: userToken!)
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
    
    ///This function perform facebook signIn process and send userToken of facebook LoggedIn user to LoginVC
    func fbLogin() {
        let login = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["email"], from: socialAuthView as! UIViewController) { ( result, error) in
            if error != nil{
                print(error?.localizedDescription)
                
            }else if (result?.isCancelled)!{
                print("User Canceled")
                self.fbLogin()
            }else{
                print("User LoggedIn")
                // Perform any operations on signed in user here.
                var access_token = result?.token.tokenString
                
                //Sending userToken from to SocialAuthVC
                self.socialAuthView?.setUserToken(token: access_token!)
            }
        }
    }
}

// MARK: - LinkedIn Authentication
extension LoginPresenter{
    
    ///This function perform LinkedIn signIn process and send userToken of LinkedIn LoggedIn user to LoginVC
    @objc func liLoginBtnclicked(){
        let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "773ed7ltg76dyf", clientSecret: "6PQF5XYK59qPvrJq", state: "DLKDJF45DIWOERCM", permissions: ["r_emailaddress", "r_basicprofile"], redirectUrl: "https://www.linkedin.com/developer/apps/5241843/auth/linkedin/callback"))
        
        
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,email-address)?format=json",
                                      requestType: LinkedinSwiftRequestGet,
                                      success: { (response) -> Void in
                                        
                                        //Request success response
                                        print(response)
                                        
                                        //Sending userToken from to SocialAuthVC
                                        self.socialAuthView?.setUserToken(token: lsToken.accessToken)
                                        
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

// MARK: - Instagram Authentication
extension LoginPresenter {
    
    ///This function  perform google signIn process and send userToken of Instagram LoggedIn user to LoginVC
    func loginWithInstagram() {
        
        // 2. Initialize your 'InstagramLoginViewController' and set your 'ViewController' to delegate it
        instaLogin = InstagramLoginViewController(clientId: API.Insta_clientID, redirectUri: API.Insta_redirectURI)
        instaLogin.delegate = self
        
        // 3. Customize it
        instaLogin.scopes = [.basic, .publicContent] // [.basic] by default; [.all] to set all permissions
        instaLogin.title = "Instagram" // If you don't specify it, the website title will be showed
        instaLogin.progressViewTintColor = .blue // #E1306C by default
        
        // If you want a .stop (or other) UIBarButtonItem on the left of the view controller
        instaLogin.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissLoginViewController))
        
        // You could also add a refresh UIBarButtonItem on the right
        instaLogin.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage))
        
        // 4. Present it inside a UINavigationController (for example)
        self.socialAuthView?.presentInsta(instagramLogin: instaLogin)
    }
    
    @objc func dismissLoginViewController() {
        instaLogin.dismiss(animated: true)
    }
    
    @objc func refreshPage() {
        instaLogin.reloadPage()
    }
    
}

extension LoginPresenter: InstagramLoginViewControllerDelegate {
    
    func instagramLoginDidFinish(accessToken: String?, error: InstagramError?) {
        
        // Whatever you want to do ...
        print(accessToken)
        
        //Sending userToken from to SocialAuthVC
        self.socialAuthView?.setUserToken(token: accessToken!)
        
        // And don't forget to dismiss the 'InstagramLoginViewController'
        instaLogin.dismiss(animated: true)
    }
}

///Twitter Authentication
extension LoginPresenter{
    
    ///This function perform twitter signIn process and send userToken of twitter LoggedIn user to LoginVC
    func twtrLogin(){
        TWTRTwitter.sharedInstance().logIn {
            (session, error) -> Void in
            if (session != nil) {
                print("signed in as \(session?.userName)")
                print(session?.authToken)
                //Sending userToken from to SocialAuthVC
                self.socialAuthView?.setUserToken(token: (session?.authToken)!)
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}

