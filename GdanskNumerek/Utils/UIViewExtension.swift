//
//  UIViewExtension.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import ObjectiveC

private var loaderAssociationKey: UInt8 = 0

extension UIView {
    
    
    
    var loader: MBProgressHUD? {
        get {
            return objc_getAssociatedObject(self, &loaderAssociationKey) as? MBProgressHUD
        }
        set(newValue) {
            objc_setAssociatedObject(self, &loaderAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func showLoader() {
        if let loader = self.loader {
            loader.hide(true)
        }
        self.loader = MBProgressHUD(view: self)
        if let loader = self.loader {
            loader.removeFromSuperViewOnHide = true
            addSubview(loader)
            loader.autoCenterInSuperview()
            loader.show(true)
        }
    }
    
    func hideLoader() {
        if let loader = self.loader {
            loader.hide(true)
        }
    }
    
    static func createViewWithShadow(viewColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = viewColor
        view.addSmallShadowBelow()
        return view
    }
    
    func addSmallShadowBelow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSizeMake(0, 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.2
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    func addMediumShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSizeMake(3, 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
    }
    
    func addBorderWithColor(color: UIColor, width: CGFloat, radius: CGFloat) {
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
    }
    
    func setupBackgroundGradient() {
        let layer = CAGradientLayer()
        layer.frame = UIScreen.mainScreen().bounds
        layer.colors = [UIColor.backgroudWhiteColorColor().CGColor, UIColor.backgroudGrayColor().CGColor]
        self.layer.addSublayer(layer)
    }
}