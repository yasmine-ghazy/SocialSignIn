//
//  ForgetPasswordVerificationLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

import UIKit
import Material

/// This class set the layout for ForgetPasswordVerificationVC
class ForgetPasswordVerificationLayout: BaseLayout {
    
    // MARK: - Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.BackGroud //.white
        return v
    }()
    
    ///This stackView contains verificationCodeLbl, verificationCodeTF, confirmCodeBtn
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 30
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    ///Verification Code Label (Enter the verification code that you recieved in your email)
    lazy var verificationCodeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "verification_lbl".localized()
        lbl.numberOfLines = 2
        return lbl
    }()
    
    ///Verification Code TextField (Enter the verification code that you recieved in your email)
    lazy var verificationCodeTF: CustomTextField = {
        let textField = CustomTextField(placeholder: "verification_tf".localized())
        return textField
    }()
    
    /// Confirm Code Button that call confirmCode() in ForgetPasswordVerificationVC
    lazy var ConfirmCodeBtn: CustomButton = {
        let button = CustomButton(title: "confirm".localized())
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
        
        stackElements = [verificationCodeLbl, verificationCodeTF, ConfirmCodeBtn]
        
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

/*
 MainBackGroudColor
 SecodBackGroundColor
 MainPlaceholderColor
 SecondPlaceholderColor
 MainButtonBackgroundColor
 SecondButtonBackgroundColor
 textColor
 
 */

