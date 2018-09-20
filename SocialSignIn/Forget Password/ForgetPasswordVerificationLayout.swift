//
//  ForgetPasswordVerificationLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import Material

class ForgetPasswordVerificationLayout: BaseLayout {
    
    // MARK: - Properties
    
    ///This is the main container that have all sub containers
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = SecondColors.BackGroud //.white
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
    
    //Label
    lazy var verificationCodeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "verification_lbl".localized()
        lbl.numberOfLines = 2
        return lbl
    }()
    
    //Text Fields
    
    lazy var verificationCodeTF: ErrorTextField = {
        let textField = ErrorTextField()
        
        textField.textAlignment = .natural
        
        //Setting placeholder text and colors
        textField.placeholder = "verification_tf".localized()
        textField.placeholderNormalColor = SecondColors.PlaceholderNormal //Color.lightGray
        textField.placeholderActiveColor = SecondColors.PlaceholderActive
        textField.placeholderAnimation = .hidden
        textField.textAlignment = .center
        
        //Setting Divider colors
        textField.dividerActiveColor = SecondColors.divider
        
        return textField
    }()
    
    lazy var ConfirmCodeBtn: RaisedButton = {
        let button = RaisedButton(title: "confirm".localized(), titleColor: SecondColors.ButtonTitle)
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
        
        stackElements = [verificationCodeLbl, verificationCodeTF, ConfirmCodeBtn]
        
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

/*
 MainBackGroudColor
 SecodBackGroundColor
 MainPlaceholderColor
 SecondPlaceholderColor
 MainButtonBackgroundColor
 SecondButtonBackgroundColor
 textColor
 
 */

