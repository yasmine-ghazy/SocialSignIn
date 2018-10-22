//
//  SocialAuthView.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

//Import Frameworks
import UIKit
import SnapKit
import Material
import Localize_Swift

/// This class set the layout for LoginVC
class LoginLayout: BaseLayout {
    
    //MARK: Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.BackGroud
        return v
    }()
    
    ///This is the top container that have logo , App Title
    lazy var topContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    ///This is the middle container that have middleStackView
    lazy var middleContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    ///This is the bottom contatiner that have SocialLogin elements
    lazy var bottomContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    ///App Logo imageView
    lazy var logoIV: UIImageView = {
        var iv = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    ///App Title Label
    lazy var appTitleLbl: UILabel = {
        let label = UILabel()
        label.text = "LOREM IPSUM"
        label.textColor = Colors.text //UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    ///Social Login Label "or login with"
    lazy var socialLoginLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "social_login".localized()
        lbl.textColor = Colors.text // .white
        lbl.backgroundColor = Colors.BackGroud
        lbl.font = lbl.font.withSize(14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    ///Container that have forgetPasswordLbl
    lazy var forgetPasswordLblContainer: UIView = {
        return UIView()
    }()
    
    ///Container that have registerLbl
    lazy var registerLblContainer: UIView = {
        return UIView()
    }()
    
    ///Forget Password Label "Forget Password?"
    lazy var forgetPasswordLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "forget_password".localized()
        lbl.textColor = Colors.text // .white
        lbl.font = lbl.font.withSize(12)
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if preferredLanguage.starts(with: "ar"){
            lbl.textAlignment = .left
        }else{
            lbl.textAlignment = .right
        }
        return lbl
    }()
    
    ///Register Label "You don't have account? Register now"
    lazy var registerLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor =  Colors.text //UIColor.white
        lbl.text = "register".localized()
        lbl.font = lbl.font.withSize(12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    ///Identity TextField "Enter Email, User Name or phone"
    lazy var identityTF: CustomTextField = {
        
        let textField = CustomTextField(placeholder: "identity".localized())
        
        //Setting focus on this textField
        textField.resignFirstResponder()
        
        return textField
    }()
    
    ///password TextField "password"
    lazy var passwordTF: CustomPasswordTF = {
        return CustomPasswordTF(placeholder: "password".localized())
    }()
    
    ///Login Button
    lazy var loginBtn: CustomButton = {
        let button = CustomButton(title: "login".localized())
        return button
    }()
    
    
    //Social Media Buttons
    lazy var facebookLoginBtn: SocialButton = {
        return SocialButton(buttonImage: #imageLiteral(resourceName: "facebook"))
    }()
    
    lazy var googleLoginBtn: SocialButton = {
        return SocialButton(buttonImage: #imageLiteral(resourceName: "google"))
    }()
    
    lazy var linkedInLoginBtn: SocialButton = {
        return SocialButton(buttonImage: #imageLiteral(resourceName: "linkedin"))
    }()
    
    lazy var instagramLoginBtn: SocialButton = {
        return SocialButton(buttonImage: #imageLiteral(resourceName: "instagram"))
    }()
    
    lazy var twitterLoginBtn: SocialButton = {
        return SocialButton(buttonImage: #imageLiteral(resourceName: "twitter"))
    }()
    
    ///This stackView contains social buttons objects
    lazy var socialButtonsStackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s 
    }()
    
    ///This stackView contains idetityTF, passwordTF, forgetPasswordLbl, registerLbl, LoginBtn
    lazy var middleStackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    
    ///Divider View for socialLoginLbl ------ or login with ------
    lazy var socialDivider: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.divider //UIColor.white
        return v
    }()
    
    var socialButtons: [UIButton] = []
    var middleElements: [Any] = []
    
    //MARK: View Initialization
    override init(superview: UIView) {
        super.init(superview: superview)
        
        //Set Social Buttons
        self.socialButtons = [googleLoginBtn, facebookLoginBtn, twitterLoginBtn, linkedInLoginBtn, instagramLoginBtn]
    }
    
    
    //MARK: Methods
    
    ///This function add view components to the superview and then call setupConstraints()
    func setupView(){
        
        self.superview.backgroundColor = Colors.BackGroud
        
        //Adding containers to the main container
        self.superview.addSubview(container)
        container.addSubview(topContainer)
        container.addSubview(middleContainer)
        container.addSubview(bottomContainer)
        
        //1.setup Top Container
        topContainer.addSubview(logoIV)
        topContainer.addSubview(appTitleLbl)
        
        //2.setup Middle Container
        middleElements = [identityTF, passwordTF, forgetPasswordLblContainer, loginBtn, registerLblContainer]
        for element in middleElements{
            middleStackView.addArrangedSubview(element as! UIView)
        }
        middleContainer.addSubview(middleStackView)
        forgetPasswordLblContainer.addSubview(forgetPasswordLbl)
        registerLblContainer.addSubview(registerLbl)
        
        //3.Setup Bottom Container
        bottomContainer.addSubview(socialDivider)
        bottomContainer.addSubview(socialLoginLbl)
        bottomContainer.addSubview(socialButtonsStackView)
        for button in socialButtons{
            socialButtonsStackView.addArrangedSubview(button)
        }
        
        setupConstraints()
    }
    
    ///This function set constraints for components in the layout view
    func setupConstraints(){
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        container.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.bottom.equalToSuperview()
        }
        
        //1. Set Top Container and sub elements Constraints
        topContainer.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(container)
            make.height.equalTo(screenHeight * 0.30)
            make.centerX.equalToSuperview()
        }
        
        appTitleLbl.snp.makeConstraints { (make) in
            make.bottom.equalTo(topContainer)
            make.leading.equalTo(topContainer)
            make.trailing.equalTo(topContainer)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        logoIV.snp.makeConstraints { (make) in
            make.top.equalTo(topContainer).offset(50)
            make.leading.equalTo(topContainer)
            make.trailing.equalTo(topContainer)
            make.bottom.equalTo(appTitleLbl.snp.top)
        }
        
        
        //2. Set bottom Container and sub elements Constraints
        bottomContainer.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(container)
            make.height.equalTo(screenHeight * 0.24) //
        }
        
        //Adding Social Buttons constraints
        let stackMargin = 25
        let buttonWidth = (Int(screenWidth) - 50 - (stackMargin * 4)) / 5
        let stackWidth = socialButtons.count * buttonWidth + stackMargin * 4
        
        socialButtonsStackView.snp.makeConstraints { (make) in
            make.height.equalTo(buttonWidth)
            make.width.equalTo(stackWidth)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(bottomContainer)
        }
        
        socialLoginLbl.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.top.equalTo(bottomContainer.snp.top)
            make.bottom.equalTo(socialButtonsStackView.snp.top)
            make.centerX.equalTo(bottomContainer)
            
        }
        
        socialDivider.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(bottomContainer)
            make.height.equalTo(1)
            make.centerY.equalTo(socialLoginLbl)
        }
        
        //3. Set middle Container and sub elements Constraints
        middleContainer.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(container)
            make.top.equalTo(topContainer.snp.bottom).offset(20)
            make.bottom.equalTo(bottomContainer.snp.top)
        }
        
        middleStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(middleContainer)
        }
        
        forgetPasswordLbl.snp.makeConstraints { (make) in
            make.trailing.top.bottom.equalTo(forgetPasswordLblContainer)
            make.width.equalTo(110)
        }
        
        registerLbl.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(registerLblContainer)
            make.width.equalTo(250)
            make.centerX.equalTo(registerLblContainer)
        }
        
    }
    
}
