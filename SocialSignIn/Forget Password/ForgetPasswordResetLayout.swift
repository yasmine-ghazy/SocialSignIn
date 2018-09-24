//
//  ForgetPasswordLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import Material

/// This class set the layout for ForgetPasswordResetVC
class ForgetPasswordResetLayout: BaseLayout {
    
    // MARK: - Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.BackGroud
        return v
    }()
    
    ///This stackView contains PasswordTF, confirmPasswordTF, resetPasswordBtn
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 30
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    ///Password TextField ("Enter New Password")
    lazy var passwordTF: CustomPasswordTF = {
        let passwordField = CustomPasswordTF(placeholder: "new_password".localized())
        
        //Setting focus on this  textField
        passwordField.resignFirstResponder()
        
        return passwordField
    }()
    
    ///Password TextField ("Confirm New Password")
    lazy var confirmPasswordTF: CustomPasswordTF = {
        let passwordField = CustomPasswordTF(placeholder: "confirm_password".localized())
        return passwordField
    }()
    
    /// Confirm Code Button that call resetPassword() in ForgetPasswordResetVC
    lazy var resetPasswordBtn: CustomButton = {
        let button = CustomButton(title: "reset_password".localized())
        return button
    }()
    
    var stackElements: [Any] = []
    
    
    
    // MARK: - Initialization
    override init(superview: UIView) {
        super.init(superview: superview)
    }
    
    // MARK: - Methods
    
    ///This function add view components to the superview and then call setupConstraints()
    func setupView(){
        
        stackElements = [passwordTF, confirmPasswordTF, resetPasswordBtn]
        
        self.superview.addSubview(container)
        container.addSubview(stackView)
        
        for elements in stackElements{
            stackView.addArrangedSubview(elements as! UIView)
        }
        
        setupConstraints()
    }
    
    ///This function set constraints for components in the layout view
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
