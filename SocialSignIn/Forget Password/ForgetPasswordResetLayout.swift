//
//  ForgetPasswordLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import Material

class ForgetPasswordResetLayout: BaseLayout {

    // MARK: - Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 30
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    //Text Fields
    lazy var passwordTF: TextField = {
        let passwordField = TextField()
        
        //Setting placeholder text and colors
        passwordField.placeholder = "Enter New Password"
        passwordField.placeholderNormalColor = Color.lightGray
        passwordField.placeholderActiveColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        passwordField.placeholderAnimation = .hidden
        
        //Setting Divider colors
        passwordField.dividerActiveColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        
        // Setting the visibilityIconButton color.
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.visibilityIconButton?.tintColor = .lightGray
        
        //Setting focus on this  textField
        passwordField.resignFirstResponder()
        
        return passwordField
    }()
    
    lazy var confirmPasswordTF: TextField = {
        let passwordField = TextField()
        
        //Setting placeholder text and colors
        passwordField.placeholder = "Confirm New Password"
        passwordField.placeholderNormalColor = Color.lightGray
        passwordField.placeholderActiveColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        passwordField.placeholderAnimation = .hidden

        //Setting Divider colors
        passwordField.dividerActiveColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        
        // Setting the visibilityIconButton color.
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.visibilityIconButton?.tintColor = .lightGray
        
        return passwordField
    }()
    
    lazy var resetPasswordBtn: RaisedButton = {
        let button = RaisedButton(title: "RESET PASSWORD", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        return button
    }()
    
    var stackElements: [Any] = []
    

    
    // MARK: - Initialization
    override init(superview: UIView) {
        super.init(superview: superview)
    }
    
    // MARK: - Methods
    func setupView(){
        
        stackElements = [passwordTF, confirmPasswordTF, resetPasswordBtn]
        
        self.superview.addSubview(container)
        container.addSubview(stackView)

        for elements in stackElements{
            stackView.addArrangedSubview(elements as! UIView)
        }
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        container.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        let stackHeight = UIScreen.main.bounds.height / 3
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(container)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container).offset(-20)
            //make.height.equalTo(200)
            make.height.equalTo(stackHeight)
        }
        
    }

}
