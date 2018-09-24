//
//  SocialButton.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

///This class customize the social button for login layout
class SocialButton: UIButton {

    /**
     Initialize a social button with image
     - parameter buttonImage: the UIImage of the social button
     */
    init(buttonImage: UIImage){
        super.init(frame: CGRect())
        self.setImage(buttonImage, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.tintColor = Colors.ButtonBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
