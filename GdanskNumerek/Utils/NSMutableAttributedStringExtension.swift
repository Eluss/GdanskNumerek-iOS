//
//  NSMutableAttributedStringExtension.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    static func stringWithText(text: String, spacingBetweenLines: CGFloat, textAlignment: NSTextAlignment) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingBetweenLines
        paragraphStyle.alignment = textAlignment
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        return attrString
    }
}