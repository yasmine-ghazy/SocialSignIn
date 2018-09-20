//
//  SocialAuthView.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import SnapKit
import Material
import Localize_Swift

class LoginLayout: BaseLayout {
    
    //MARK: Properties
    // var socialAuthDelegate: SocialAuthDelegate!
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = MainColors.BackGroud
        return v
    }()
    
    ///This is the top container that have logo , App Title
    lazy var topContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    ///This is the middle container that have textFields, Buttons
    lazy var middleContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    ///This is the bottom contatiner that have SocialLogin elements
    lazy var bottomContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    //App Logo imageView
    lazy var logoIV: UIImageView = {
        var iv = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    //Labels
    lazy var appTitleLbl: UILabel = {
        let label = UILabel()
        label.text = "LOREM IPSUM"
        label.textColor = MainColors.text //UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var socialLoginLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "social_login".localized()
        lbl.textColor = MainColors.text // .white
        lbl.backgroundColor = MainColors.BackGroud
        lbl.font = lbl.font.withSize(14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var forgetPasswordBtn: UILabel = {
        let lbl = UILabel()
        lbl.text = "forget_password".localized()
        lbl.textColor = MainColors.text // .white
        lbl.font = lbl.font.withSize(12)
        
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if preferredLanguage.starts(with: "ar"){
            lbl.textAlignment = .left
        }else{
            lbl.textAlignment = .right
        }
        return lbl
    }()
    
    lazy var registerBtn: UILabel = {
        let lbl = UILabel()
        lbl.textColor =  MainColors.text //UIColor.white
        lbl.text = "register".localized()
        lbl.font = lbl.font.withSize(12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    //Text Fields
    lazy var identityTF: ErrorTextField = {
        let textField = ErrorTextField()
        
        textField.textColor = MainColors.text//.white
        textField.textAlignment = .natural
        
        //Setting placeholder text and colors
        textField.placeholder = "identity".localized()
        textField.placeholderNormalColor = MainColors.Placeholder //.white
        textField.placeholderActiveColor = MainColors.Placeholder //.white
        textField.placeholderAnimation = .hidden
        
        //Setting Divider colors
        textField.dividerActiveColor = MainColors.divider //.white
        
        // Setting the visibilityIconButton color.
        textField.clearButtonMode = .whileEditing
        
        //Setting focus on this  textField
        textField.resignFirstResponder()
        
        return textField
    }()
    
    lazy var passwordTF: TextField = {
        let passwordField = TextField()
        
         passwordField.textColor = MainColors.text //.white
        passwordField.textAlignment = .natural
        
        //Setting placeholder text and colors
        passwordField.placeholder = "password".localized()
        passwordField.placeholderNormalColor = MainColors.Placeholder //Color.white
        passwordField.placeholderActiveColor = MainColors.Placeholder //.white
        passwordField.placeholderAnimation = .hidden
        
        //Setting Divider colors
        passwordField.dividerActiveColor = MainColors.divider //.white
        
        // Setting the visibilityIconButton color.
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.visibilityIconButton?.tintColor = MainColors.divider //.white
        
        //Setting focus on this  textField
        passwordField.resignFirstResponder()
        
        return passwordField
    }()
    
    
    
    //Buttons
    lazy var loginBtn: RaisedButton = {
        let button = RaisedButton(title: "login".localized(), titleColor: MainColors.ButtonTitle)
        button.backgroundColor = MainColors.ButtonBackground //.white
        button.pulseColor = MainColors.ButtonTitle
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
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
    
    lazy var socialButtonsStackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s 
    }()
    
    lazy var middleStackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    
    //Dividers Views
    lazy var socialDivider: UIView = {
        let v = UIView()
        v.backgroundColor = MainColors.divider //UIColor.white
        return v
    }()
    
    var socialButtons: [UIButton] = []
    var middleElements: [Any] = []
    
    //MARK: View Initialization
    /*
     init(superview: UIView, socialAuthDelegate: SocialAuthDelegate) {
     super.init(superview: superview)
     self.socialAuthDelegate = socialAuthDelegate
     }
     */
    
    override init(superview: UIView) {
        super.init(superview: superview)
        
        //Set Social Buttons
        self.socialButtons = [googleLoginBtn, facebookLoginBtn, twitterLoginBtn, linkedInLoginBtn, instagramLoginBtn]
    }
    
    
    //MARK: Methods
    
    ///This function add view components to the superview and then call setupConstraints()
    func setupView(){
 
        self.superview.backgroundColor = MainColors.BackGroud
        
        //Adding containers to the main container
        self.superview.addSubview(container)
        container.addSubview(topContainer)
        container.addSubview(middleContainer)
        container.addSubview(bottomContainer)
        
        //1.setup Top Container
        
        topContainer.addSubview(logoIV)
        topContainer.addSubview(appTitleLbl)
        
        //2.setup Middle Container
        middleElements = [identityTF, passwordTF, forgetPasswordBtn, loginBtn, registerBtn]
        for element in middleElements{
            middleStackView.addArrangedSubview(element as! UIView)
        }
        middleContainer.addSubview(middleStackView)
        
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
            //make.bottom.equalTo(bottomContainer.snp.bottom).offset(-40)
            make.centerY.equalTo(bottomContainer)
        }
        
        socialLoginLbl.snp.makeConstraints { (make) in
            //make.leading.equalTo(bottomContainer).offset(70)
            //make.trailing.equalTo(bottomContainer).offset(-70)
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
        
    }
}
