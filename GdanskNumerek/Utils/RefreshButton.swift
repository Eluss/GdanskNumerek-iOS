//
//  DivisionButton.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class RefreshButton: Button {
    
    private var borderColor: UIColor!
    private var primaryGradientColor: UIColor!
    private var secondaryGradientcolor: UIColor!
    private var textColor: UIColor!
    private var size: CGSize!
    private var gradientLayer: CAGradientLayer!
    
    private let cornerRadius: CGFloat = 10
    private let spacingBetweenLines: CGFloat = 5
    
    init(size: CGSize) {
        super.init(frame: CGRectZero)
        
        self.size = size
        applyRedStyle()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let refreshLabel = LabelStyles.queueNameLabel(UILabel())
        refreshLabel.textColor = self.textColor
        refreshLabel.text = "Odśwież"
        self.addSubview(refreshLabel)
        refreshLabel.autoCenterInSuperview()
    }
    
    func applyRedStyle() {
        self.borderColor = UIColor.blackColor()
        self.primaryGradientColor = UIColor.redColor()
        self.secondaryGradientcolor = UIColor.darkRedColor()
        self.textColor = UIColor.lightWhiteColor()
        applyStyles()
    }
    
    private func applyStyles() {
        applyGradient()
        addBorderWithColor(self.borderColor, width: 1, radius: self.cornerRadius)
        addMediumShadow()
    }
    
    private func applyGradient() {
        let layer = CAGradientLayer()
        layer.cornerRadius = self.cornerRadius
        layer.frame = CGRectMake(0, 0, self.size.width, self.size.height)
        layer.colors = [self.primaryGradientColor.CGColor, self.secondaryGradientcolor.CGColor]
        self.gradientLayer = layer
        self.layer.addSublayer(layer)
    }
    
    override func setPressedState() {
        UIView.animateWithDuration(0.05, animations: {
            self.layer.masksToBounds = true
            self.gradientLayer.cornerRadius = self.cornerRadius
            self.gradientLayer.frame = CGRectMake(0, 0, self.size.width, self.size.height)
            self.gradientLayer.colors = [self.secondaryGradientcolor.CGColor, self.primaryGradientColor.CGColor]
        })
    }
    
    override func setNormalState() {
        UIView.animateWithDuration(0.05, animations: {
            self.layer.masksToBounds = false
            self.gradientLayer.cornerRadius = self.cornerRadius
            self.gradientLayer.frame = CGRectMake(0, 0, self.size.width, self.size.height)
            self.gradientLayer.colors = [self.primaryGradientColor.CGColor, self.secondaryGradientcolor.CGColor]
        })
    }
    
}