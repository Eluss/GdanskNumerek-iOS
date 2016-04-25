//
//  UIColorExtension.swift
//  LoveLifeHelper
//
//  Created by Eliasz Sawicki on 16/01/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
    static func grayBorderColor() -> UIColor {
        return UIColor.init(hex: 0xAFAFAF)
    }
    
    static func mainRedColor() -> UIColor {
        return UIColor.init(hex: 0xCC0000)
    }
    
    static func lightWhiteColor() -> UIColor {
        return UIColor.init(hex: 0xF0FAFB)
    }
    
    static func backgroudGrayColor() -> UIColor {
        return UIColor.init(hex: 0xCECECE)
    }
    
    static func backgroudWhiteColorColor() -> UIColor {
        return UIColor.init(hex: 0xF0FAFB)
    }
    
    static func darkRedColor() -> UIColor {
        return UIColor.init(hex: 0xA60909)
    }
    
    static func grayTextColor() -> UIColor {
        return UIColor.init(hex: 0x353535)
    }
    
    static func blackTextColor() -> UIColor {
        return UIColor.init(hex: 0x2D2D2D)
    }
    
    static func lightGrayTextColor() -> UIColor {
        return UIColor.init(hex: 0xB4B4B4)
    }
    
    static func darkGrayTextcolor() -> UIColor {
        return UIColor.init(hex: 0x646464)
    }
    
}