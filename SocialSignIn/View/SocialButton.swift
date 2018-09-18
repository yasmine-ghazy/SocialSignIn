//
//  SocialButton.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class SocialButton: UIButton {

    init(buttonImage: UIImage){
        super.init(frame: CGRect())
        self.setImage(buttonImage, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
