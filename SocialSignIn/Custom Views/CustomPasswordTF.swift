//
//  passwordTF.swift
//  SocialSignIn
//
//  Created by apple on 9/23/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//Import Frameworks
import Foundation
import Material
import Localize_Swift

///This class customize the password TextField for the app
class CustomPasswordTF: UIView{
    
    //MARK: - Properties
    var iconClick = false
    
    //This is the password TextField
    lazy var passwordTF: TextField = {
        let passwordField = TextField()
        passwordField.textColor = Colors.text
        
        //Setting placeholder text and colors
        passwordField.placeholder = "password".localized()
        passwordField.placeholderNormalColor = Colors.PlaceholderNormal //Color.white
        passwordField.placeholderActiveColor = Colors.PlaceholderActive //.white
        passwordField.placeholderAnimation = .hidden
        
        //Setting Divider colors
        passwordField.dividerActiveColor = Colors.divider //.white
        passwordField.isSecureTextEntry = true
        
        return passwordField
    }()
    
    /**
     This is the visiblity eye button that is set with an image
     - closeEye : Password is invisible
     - openEye : password is visible
     */
    lazy var eyeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setImage(closeEye, for: .normal)
        btn.tintColor = Colors.divider
        btn.addTarget(self, action: #selector(iconAction), for: .touchUpInside)
        return btn
    }()
    
    ///Password is invisible image ex:(****)
    lazy var closeEye: UIImage = {
        let closeEyeImg: UIImage = #imageLiteral(resourceName: "eye-with-a-diagonal-line-interface-symbol-for-invisibility-1")
        let tintedImage = closeEyeImg.withRenderingMode(.alwaysTemplate)
        return tintedImage
    }()
    
    ///Password is visible image ex:(1234)
    lazy var openEye: UIImage = {
        let openEyeImg: UIImage = #imageLiteral(resourceName: "eye-open copy")
        let tintedImage = openEyeImg.withRenderingMode(.alwaysTemplate)
        return tintedImage
    }()
    
    
    
    //MARK: - Initialization
    
    /**
     Initialize a customPasswordTF with placeholder returns a view that contains PasswordTF and eyeBtn
     - parameter buttonImage: the placeholder of the customPasswordTF
     */
    init(placeholder: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        passwordTF.placeholder = placeholder
        
        //add Subviews
        self.addSubview(passwordTF)
        self.addSubview(eyeBtn)
        
        //Set Constraints
        passwordTF.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        eyeBtn.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalTo(passwordTF)
            make.width.equalTo(passwordTF.snp.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    ///This function is called when EyeBtn is pressed, it toggle the password visibility
    @objc func iconAction(sender: AnyObject) {
        print("icon Action clicked")
        
        if let textRange = passwordTF.textRange(from: passwordTF.beginningOfDocument, to: passwordTF.endOfDocument) {
            passwordTF.replace(textRange, withText: passwordTF.text!)
        }
        if(iconClick == true) {
            passwordTF.isSecureTextEntry = true
            eyeBtn.setImage(closeEye, for: .normal)
        } else {
            passwordTF.isSecureTextEntry = false
            eyeBtn.setImage(openEye, for: .normal)
        }
        iconClick = !iconClick
    }
}

extension TextField{
    
    /**
     This function return the padding of the textField to make inset for the eyeBtn w.r.t its localization
     */
    func getPadding() -> UIEdgeInsets{
        let padding: UIEdgeInsets
        if Localize.currentLanguage() == "ar"{
            padding = UIEdgeInsets(top: 0, left: bounds.height, bottom: 0, right: 0)
        }
        else{
            padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: bounds.height)
        }
        return padding
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding()
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding()
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = getPadding()
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
