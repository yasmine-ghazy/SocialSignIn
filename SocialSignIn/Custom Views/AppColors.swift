//
//  Colors.swift
//  SocialSignIn
//
//  Created by apple on 9/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

/// This class contains app palete colors that will be changed by the user
class AppColors{
    static let color1: UIColor = #colorLiteral(red: 0.000113729955, green: 0.5750550628, blue: 0.7006892562, alpha: 1)
    static let color2: UIColor = .white
    static let color3: UIColor = .lightGray
    static let color4: UIColor = .black
}

/// This enumeration contains all paletes available in the app
public enum Palete:Int {
    case main = 0
    case second = 1
}

/// This class contains color schema paletes
class Colors{
    static var BackGroud: UIColor!
    static var divider: UIColor!
    static var ButtonBackground: UIColor!
    static var ButtonTitle: UIColor!
    static var text: UIColor!
    static var PlaceholderActive: UIColor!
    static var PlaceholderNormal: UIColor!
    static var backBtn: UIColor!
    
    /**
     This method set the palete type which will initialize the palete colors
     - parameter palete: .main or .second
     */
    public static func setPalete(palete: Palete){
        switch palete {
        case .main:
            BackGroud = AppColors.color1
            PlaceholderActive = AppColors.color2
            PlaceholderNormal = AppColors.color2
            divider = AppColors.color2
            ButtonBackground = AppColors.color2
            ButtonTitle = AppColors.color1
            text = AppColors.color2
            backBtn = AppColors.color2
            break
        case .second:
            BackGroud = AppColors.color2
            PlaceholderActive = AppColors.color1
            PlaceholderNormal = AppColors.color3
            divider = AppColors.color1
            ButtonBackground = AppColors.color1
            ButtonTitle = AppColors.color2
            text = AppColors.color4
            backBtn = AppColors.color1
            break
        }
    }
    
}
