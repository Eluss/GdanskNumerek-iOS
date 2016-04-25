//
//  SimpleAlert.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 08/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class SimpleAlert: NSObject {

    static func showSimpleAlertWithTitle(title: String, errorMessage: String) {
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        let currentController = UIApplication.sharedApplication().keyWindow?.rootViewController
        currentController?.presentViewController(alertController, animated: true, completion: nil)
    }
    
}