//
//  CustomButton.swift
//  SocialSignIn
//
//  Created by apple on 9/24/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

//Import Frameworks
import Foundation
import Material

///This class customize the main button for the app
class CustomButton: RaisedButton{
    
    /**
     Initialize a button with title
     - parameter title: the title of the CustomButton
     */
    init(title: String){
        super.init(title: title, titleColor: Colors.ButtonTitle)
        backgroundColor = Colors.ButtonBackground //.white
        pulseColor = Colors.ButtonTitle
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


