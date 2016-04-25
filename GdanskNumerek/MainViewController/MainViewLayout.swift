//
//  MainViewLayout.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class MainViewLayout: NSObject {
    
    weak var mainView: MainView!
    
    func applyConstraints() {
        addViewsToSubview()
        self.mainView.chooseDivisionLabel.autoPinEdge(.Top, toEdge: .Top, ofView: self.mainView, withOffset: 35, relation: .LessThanOrEqual)
        self.mainView.chooseDivisionLabel.autoPinEdge(.Top, toEdge: .Top, ofView: self.mainView, withOffset: 10, relation: .GreaterThanOrEqual)
        self.mainView.chooseDivisionLabel.autoPinEdgeToSuperviewEdge(.Left)
        self.mainView.chooseDivisionLabel.autoPinEdgeToSuperviewEdge(.Right)
        
        self.mainView.street1Button.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.chooseDivisionLabel, withOffset: 30, relation: .LessThanOrEqual)
        self.mainView.street1Button.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.chooseDivisionLabel, withOffset: 10, relation: .GreaterThanOrEqual)
        self.mainView.street1Button.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        self.mainView.street1Button.autoSetDimensionsToSize(divisionButtonSize())
        
        self.mainView.street3Button.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.street1Button, withOffset: 10)
        self.mainView.street3Button.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        self.mainView.street3Button.autoSetDimensionsToSize(divisionButtonSize())
        
        self.mainView.street2Button.autoAlignAxis(.Horizontal, toSameAxisOfView: self.mainView.street1Button)
        self.mainView.street2Button.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        self.mainView.street2Button.autoSetDimensionsToSize(divisionButtonSize())
        
        self.mainView.street4Button.autoAlignAxis(.Horizontal, toSameAxisOfView: self.mainView.street3Button)
        self.mainView.street4Button.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        self.mainView.street4Button.autoSetDimensionsToSize(divisionButtonSize())
        
        self.mainView.firstUnderline.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.street4Button, withOffset: 60, relation: .LessThanOrEqual)
        self.mainView.firstUnderline.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.street4Button, withOffset: 10, relation: .GreaterThanOrEqual)
        self.mainView.firstUnderline.autoSetDimension(.Height, toSize: 2)
        self.mainView.firstUnderline.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        self.mainView.firstUnderline.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        
        self.mainView.secondUnderline.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.firstUnderline, withOffset: 2)
        self.mainView.secondUnderline.autoSetDimension(.Height, toSize: 2)
        self.mainView.secondUnderline.autoPinEdgeToSuperviewEdge(.Left, withInset: 40)
        self.mainView.secondUnderline.autoPinEdgeToSuperviewEdge(.Right, withInset: 40)
        
        self.mainView.infoLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.secondUnderline, withOffset: 60, relation: .LessThanOrEqual)
        self.mainView.infoLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.mainView.secondUnderline, withOffset: 10, relation: .GreaterThanOrEqual)
        self.mainView.infoLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.mainView.gdanskImageView, withOffset: -10, relation: .LessThanOrEqual)
        self.mainView.infoLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.mainView.gdanskImageView, withOffset: -60, relation: .GreaterThanOrEqual)
        self.mainView.infoLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        self.mainView.infoLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        
        self.mainView.infoLabelLeftBorder.autoPinEdge(.Right, toEdge: .Left, ofView: self.mainView.infoLabel, withOffset: -10)
        self.mainView.infoLabelLeftBorder.autoPinEdge(.Top, toEdge: .Top, ofView: self.mainView.infoLabel, withOffset: -10)
        self.mainView.infoLabelLeftBorder.autoSetDimensionsToSize(CGSizeMake(1, 20))
        
        self.mainView.infoLabelTopBorder.autoPinEdge(.Left, toEdge: .Left, ofView: self.mainView.infoLabel, withOffset: -10)
        self.mainView.infoLabelTopBorder.autoPinEdge(.Top, toEdge: .Top, ofView: self.mainView.infoLabel, withOffset: -10)
        self.mainView.infoLabelTopBorder.autoSetDimensionsToSize(CGSizeMake(20, 1))
        
        self.mainView.bipImageView.autoPinEdgeToSuperviewEdge(.Left, withInset:20)
        self.mainView.bipImageView.autoSetDimensionsToSize(self.mainView.bipImageView.image!.size)
        self.mainView.bipImageView.autoPinEdge(.Top, toEdge: .Top, ofView: self.mainView.gdanskImageView)
        
        self.mainView.gdanskImageView.autoPinEdgeToSuperviewEdge(.Right, withInset:20)
        self.mainView.gdanskImageView.autoSetDimensionsToSize(self.mainView.gdanskImageView.image!.size)
        self.mainView.gdanskImageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset:20)
        
    }
    
    private func addViewsToSubview() {
        self.mainView.addSubview(self.mainView.chooseDivisionLabel)
        self.mainView.addSubview(self.mainView.street1Button)
        self.mainView.addSubview(self.mainView.street2Button)
        self.mainView.addSubview(self.mainView.street3Button)
        self.mainView.addSubview(self.mainView.street4Button)
        self.mainView.addSubview(self.mainView.firstUnderline)
        self.mainView.addSubview(self.mainView.secondUnderline)
        self.mainView.addSubview(self.mainView.infoLabel)
        self.mainView.addSubview(self.mainView.infoLabelTopBorder)
        self.mainView.addSubview(self.mainView.infoLabelLeftBorder)
        self.mainView.addSubview(self.mainView.bipImageView)
        self.mainView.addSubview(self.mainView.gdanskImageView)
    }
    
    
    func divisionButtonSize() -> CGSize {
        let buttonWidth = divisionButtonWidth()
        let size = CGSizeMake(buttonWidth, 70)
        return size
    }
    
    private func divisionButtonWidth() -> CGFloat {
        let totalScreenWidth = UIScreen.mainScreen().bounds.width
        let totalHorizontalSpacings = CGFloat(2 * 10 + 20)
        let buttonWidth = (totalScreenWidth - totalHorizontalSpacings) / 2
        return buttonWidth
    }

}
