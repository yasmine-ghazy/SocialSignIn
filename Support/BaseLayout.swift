//
//  BaseLayout.swift
//  SocialSignIn
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
import UIKit

public class BaseLayout {
    
    var superview: UIView!
    
    init(superview: UIView) {
        self.superview = superview
        self.superview.backgroundColor = .white
    }
    
    func append(elements: [Any], to stackView: UIStackView){
        for element in elements{
            stackView.addArrangedSubview(element as! UIView)
        }
    }
}

