//
//  UIFontExtension.swift
//  LoveLifeHelper
//
//  Created by Eliasz Sawicki on 19/01/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func standardFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Arial" , size: size)!
    }
    
    static func boldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-BoldMT", size: size)!
    }
    
}