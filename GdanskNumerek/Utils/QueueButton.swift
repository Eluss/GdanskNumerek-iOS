//
//  DivisionButton.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class QueueButton: Button {
    
    private(set) var dataSource: QueuesDataSource!
    private var borderColor: UIColor!
    private var primaryGradientColor: UIColor!
    private var secondaryGradientcolor: UIColor!
    private var textColor: UIColor!
    private var size: CGSize!
    private var gradientLayer: CAGradientLayer!
    private var title: String!
    private var letter: String!
    private(set) var index: Int!
    
    private let cornerRadius: CGFloat = 10
    private let spacingBetweenLines: CGFloat = 5
    
    init(letter: String, title: String, size: CGSize, index: Int) {
        super.init(frame: CGRectZero)
        self.index = index
        self.size = size
        self.letter = letter
        self.title = title
        self.index % 2 == 0 ? applyGrayStyle() : applyRedStyle()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let letterLabel = LabelStyles.queueLetterLabel(UILabel())
        letterLabel.textColor = self.textColor
        letterLabel.text = self.letter.uppercaseString
        self.addSubview(letterLabel)
        letterLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        letterLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        
        let queueLabel = LabelStyles.queueNameLabel(UILabel())
        queueLabel.textColor = self.textColor
        queueLabel.text = self.title
        self.addSubview(queueLabel)
        queueLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 40)
        queueLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        
    }
    
    func applyRedStyle() {
        self.borderColor = UIColor.blackColor()
        self.primaryGradientColor = UIColor.redColor()
        self.secondaryGradientcolor = UIColor.darkRedColor()
        self.textColor = UIColor.lightWhiteColor()
        applyStyles()
    }
    
    func applyGrayStyle() {
        self.borderColor = UIColor.grayBorderColor()
        self.primaryGradientColor = UIColor.lightWhiteColor()
        self.secondaryGradientcolor = UIColor.backgroudGrayColor()
        self.textColor = UIColor.blackColor()
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