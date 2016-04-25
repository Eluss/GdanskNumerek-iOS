//
//  UIViewControllerExtension.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 07/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupAttributedTitle(title: String) {
        let title = title
        let attributedTitle = NSMutableAttributedString(string: title)
        attributedTitle.addAttributes([NSFontAttributeName:UIFont.standardFontWithSize(25)], range: NSMakeRange(0, title.characters.count))
        attributedTitle.addAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], range: NSMakeRange(0, title.characters.count))
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedTitle
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    func setupNavigationBar() {
        self.edgesForExtendedLayout = .None
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor.mainRedColor()
    }
}