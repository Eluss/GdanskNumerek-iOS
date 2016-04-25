//
//  LabelStyles.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class LabelStyles: NSObject {
    
    static func infoParagraphLabel(label: UILabel, withText text: String) -> UILabel {
        label.textAlignment =  .Left
        label.numberOfLines = 0
        label.font = UIFont.standardFontWithSize(12)
        label.textColor = UIColor.grayTextColor()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .Left
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        return label
    }
    
    static func divisionButtonLabel(label: UILabel){
        label.textAlignment = .Center
        label.numberOfLines = 3
        label.font = UIFont.standardFontWithSize(12)
    }
    
    static func queueLetterLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Left
        label.numberOfLines = 0
        label.font = UIFont.boldFontWithSize(25)
        label.textColor = UIColor.lightWhiteColor()
        return label
    }
    
    static func queueNameLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Left
        label.numberOfLines = 0
        label.font = UIFont.standardFontWithSize(14)
        label.textColor = UIColor.lightWhiteColor()
        return label
    }
    
    static func numberInfoLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Center
        label.numberOfLines = 0
        label.font = UIFont.boldFontWithSize(18)
        label.textColor = UIColor.lightGrayTextColor()
        return label
    }
    
    static func currentNumberLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Center
        label.numberOfLines = 0
        label.font = UIFont.boldFontWithSize(23)
        label.textColor = UIColor.blackTextColor()
        return label
    }
    
    static func ticketTitleLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.font = UIFont.boldFontWithSize(12)
        label.textColor = UIColor.blackTextColor()
        return label
    }
    
    static func titledValueTitleLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Left
        label.numberOfLines = 1
        label.font = UIFont.standardFontWithSize(12)
        label.textColor = UIColor.blackTextColor()
        return label
    }
    
    static func titledValueValueLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Right
        label.numberOfLines = 1
        label.font = UIFont.boldFontWithSize(12)
        label.textColor = UIColor.blackTextColor()
        return label
    }
    
    static func ticketTimeLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Center
        label.numberOfLines = 1
        label.font = UIFont.standardFontWithSize(10)
        label.textColor = UIColor.blackTextColor()
        return label
    }
    
    
    static func refreshLabel(label: UILabel) -> UILabel {
        label.textAlignment =  .Center
        label.numberOfLines = 1
        label.font = UIFont.boldFontWithSize(12)
        label.textColor = UIColor.darkGrayTextcolor()
        return label
    }
}