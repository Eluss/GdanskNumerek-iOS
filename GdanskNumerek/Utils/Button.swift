//
//  Button.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class Button: UIButton {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        setPressedState()
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        setNormalState()
        super.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        setNormalState()
        super.touchesCancelled(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
    }
    
    func setPressedState() {
    }
    
    func setNormalState() {
    }
}