//
//  BaseLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

//Import FrameWorks
import UIKit
import Material

///This class customize all layouts in the app
public class BaseLayout {
    
    // MARK: - Properties
    
    ///This view act as the SuperView of the BaseLayout
    var superview: UIView!
    
    //MARK: - Initialization
    
    ///Initialize the layout superview with a view passed from viewController
    init(superview: UIView) {
        self.superview = superview
        self.superview.backgroundColor = .white
    }
}

