//
//  SocialAuthView.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
//import GoogleSignIn
import SnapKit

/*
@objc protocol SocialAuthDelegate{
    /*
    @objc func googleLogin()
    @objc func facebookLogin()
    @objc func twitterLogin()
    @objc func linkedinLogin()
    @objc func instagramLogin()
 */
}
*/

class SocialAuthLayout: BaseLayout {
    
    //MARK: Properties
   // var socialAuthDelegate: SocialAuthDelegate!
    
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
    
    lazy var stackView: UIStackView = {
        let s = UIStackView(frame: (superview?.bounds)!)
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 10
        s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return s 
    }()
    
    lazy var container: UIView = {
        let v = UIView()
        return v
    }()
    
    
    //MARK: View Initialization
    /*
    init(superview: UIView, socialAuthDelegate: SocialAuthDelegate) {
        super.init(superview: superview)
        self.socialAuthDelegate = socialAuthDelegate
        
    }
 */
    
    override init(superview: UIView) {
        super.init(superview: superview)
        self.superview = superview
        self.superview.backgroundColor = .white
    }
    
    
    //MARK: Methods
    func setupView(){
        
        self.superview.backgroundColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
        
        //Adding view components
        self.superview.addSubview(container)
        container.addSubview(stackView)
        
        let buttons: [UIButton] = [ googleLoginBtn, facebookLoginBtn, twitterLoginBtn, linkedInLoginBtn, instagramLoginBtn]
        //let buttons: [UIButton] = [ facebookLoginBtn, twitterLoginBtn, instagramLoginBtn]
        
        for button in buttons{
            stackView.addArrangedSubview(button)
        }
        
        //Adding view constraints
        let stackMargin = 10
        let buttonWidth = (Int(UIScreen.main.bounds.width) - (stackMargin * 6)) / 5
        let stackWidth = buttons.count * buttonWidth
        
        container.snp.makeConstraints { (make) in
            make.height.equalTo(buttonWidth)
            make.width.equalTo(stackWidth)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        //Adding login buttons action
        /*
        googleLoginBtn.addTarget(self, action: #selector(self.socialAuthDelegate.googleLogin) , for: .touchUpInside)
        facebookLoginBtn.addTarget(self, action: #selector(self.socialAuthDelegate.facebookLogin) , for: .touchUpInside)
        linkedInLoginBtn.addTarget(self, action: #selector(self.socialAuthDelegate.linkedinLogin) , for: .touchUpInside)
        instagramLoginBtn.addTarget(self, action: #selector(self.socialAuthDelegate.instagramLogin), for: .touchUpInside)
        twitterLoginBtn.addTarget(self, action: #selector(self.socialAuthDelegate.twitterLogin), for: .touchUpInside)
 */
    }
    
}
