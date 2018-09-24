//
//  ChangePasswordLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//Import Frameworks
import UIKit


/// This class set the layout for ChangePasswordVC
class ChangePasswordLayout: BaseLayout{
    
    // MARK: - Properties
    
    ///This is the main container that have stackView object
    lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = Colors.BackGroud //.white
        return v
    }()
    
    ///This stackView contains oldPasswordTF, newPasswordTF, confirmPasswordTF, resetPasswordBtn
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 30
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s
    }()
    
    ///old password TextField
    lazy var oldPasswordTF: CustomPasswordTF = {
        CustomPasswordTF(placeholder: "old_password".localized())
    }()
    
    ///new password TextField
    lazy var newPasswordTF: CustomPasswordTF = {
        CustomPasswordTF(placeholder: "new_password".localized())
    }()
    
    ///confirm password TextField
    lazy var confirmPasswordTF: CustomPasswordTF = {
        CustomPasswordTF(placeholder: "confirm_password".localized())
    }()
    
    ///Reset Password Button
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
        
        stackElements = [oldPasswordTF, newPasswordTF,confirmPasswordTF, resetPasswordBtn]
        
        //Add SubView
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
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(container)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container).offset(-20)
            make.bottom.equalTo(container.snp.centerY) //270
        }
        
    }
    
    
}
