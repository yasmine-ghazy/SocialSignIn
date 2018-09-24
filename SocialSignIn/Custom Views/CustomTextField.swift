//
//  CustomTextField.swift
//  SocialSignIn
//
//  Created by apple on 9/24/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

//Import Frameworks
import Foundation
import Material

///This class customize the main TextField for the app (Email - name ...)
class CustomTextField: ErrorTextField{
    
    /**
     Initialize a customTextField with placeholder
     - parameter placeholder: the placeholder of the customTextField
     */
    init(placeholder: String){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        textColor = Colors.text
        
        //Setting placeholder text and colors
        self.placeholder = placeholder
        placeholderNormalColor = Colors.PlaceholderNormal //.white
        placeholderActiveColor = Colors.PlaceholderActive //.white
        placeholderAnimation = .hidden
        
        //Setting Divider colors
        dividerActiveColor = Colors.divider //.white
        clearButtonMode = .whileEditing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
