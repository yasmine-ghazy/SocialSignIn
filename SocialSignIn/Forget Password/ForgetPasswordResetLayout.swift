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
        v.backgroundColor = SecondColors.BackGroud
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
        
        passwordField.textAlignment = .natural
        //Setting placeholder text and colors
        passwordField.placeholder = "new_password".localized()
        passwordField.placeholderNormalColor = SecondColors.PlaceholderNormal//Color.lightGray
        passwordField.placeholderActiveColor = SecondColors.PlaceholderActive
        passwordField.placeholderAnimation = .hidden
        
        //Setting Divider colors
        passwordField.dividerActiveColor = SecondColors.divider
        
        // Setting the visibilityIconButton color.
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.visibilityIconButton?.tintColor = SecondColors.divider //.lightGray
        
        //Setting focus on this  textField
        passwordField.resignFirstResponder()
        
        return passwordField
    }()
    
    lazy var confirmPasswordTF: TextField = {
        let passwordField = TextField()
        
        passwordField.textAlignment = .natural
        //Setting placeholder text and colors
        passwordField.placeholder = "confirm_password".localized()
        passwordField.placeholderNormalColor = SecondColors.PlaceholderNormal
        passwordField.placeholderActiveColor = SecondColors.PlaceholderActive
        passwordField.placeholderAnimation = .hidden

        //Setting Divider colors
        passwordField.dividerActiveColor = SecondColors.divider
        
        // Setting the visibilityIconButton color.
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.clearButtonMode = .whileEditing
        passwordField.visibilityIconButton?.tintColor = SecondColors.divider //.lightGray
        
        return passwordField
    }()
    
    lazy var resetPasswordBtn: RaisedButton = {
        let button = RaisedButton(title: "reset_password".localized(), titleColor: SecondColors.ButtonTitle)
        button.pulseColor = SecondColors.ButtonTitle //.white
        button.backgroundColor = SecondColors.ButtonBackground
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
