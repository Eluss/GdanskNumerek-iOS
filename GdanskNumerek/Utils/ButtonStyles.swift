//
//  ButtonStyles.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class ButtonStyles: NSObject {

    static func divisionButton(button: DivisionButton) -> DivisionButton {
        button.backgroundColor = UIColor.mainRedColor()
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        return button
    }
}