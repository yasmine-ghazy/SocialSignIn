//
//  ForgetPasswordLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

import UIKit

/// This class set the layout for ForgetPasswordVC
class ForgetPasswordLayout: BaseLayout {
    
    // MARK: - Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.BackGroud //.white
        return v
    }()
    
    ///This stackView contains resetPasswordLbl, identityTF, resetPasswordBtn
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 30
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    ///Reset Password Label (Enter your email or phone number to reset your password)
    lazy var resetPasswordLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "identity_lbl".localized()
        lbl.textAlignment = .natural
        lbl.numberOfLines = 2
        return lbl
    }()
    
    ///Identity Text Field (Enter Email or phone Number)
    lazy var identityTF: CustomTextField = {
        let textField = CustomTextField(placeholder: "identity_tf".localized())
        return textField
    }()
    
    ///Reset Password Button that call reserPassword() in ForgetPasswordVC
    lazy var resetPasswordBtn: CustomButton = {
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
        
        stackElements = [resetPasswordLbl, identityTF, resetPasswordBtn]
        
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
            make.height.equalTo(stackHeight)
        }
        
    }
    
}

