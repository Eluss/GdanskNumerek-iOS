//
//  SinleQueueViewLayout.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 07/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class SingleQueueViewLayout: NSObject {
    
    weak var singleQueueView: SingleQueueView!
    
    func addViewsToSubview() {
        self.singleQueueView.addSubview(self.singleQueueView.infoLabel)
        self.singleQueueView.addSubview(self.singleQueueView.ticketImageView)
        self.singleQueueView.addSubview(self.singleQueueView.ticketTimeLabel)
        let tickeImageView = self.singleQueueView.ticketImageView
        tickeImageView.addSubview(self.singleQueueView.ticketTitleLabel)
        tickeImageView.addSubview(self.singleQueueView.ticketHandledLabel)
        tickeImageView.addSubview(self.singleQueueView.ticketCurrentNumberLabel)
        tickeImageView.addSubview(self.singleQueueView.peopleInQueueValueField)
        tickeImageView.addSubview(self.singleQueueView.numberOfHandlersValueField)
        tickeImageView.addSubview(self.singleQueueView.averageTimeValueField)
        self.singleQueueView.addSubview(self.singleQueueView.refreshButton)
    }
    
    func applyConstraints() {
        self.singleQueueView.infoLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.singleQueueView.ticketImageView, withOffset: -60)
        self.singleQueueView.infoLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        self.singleQueueView.infoLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)

        self.singleQueueView.ticketTimeLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: self.singleQueueView.ticketImageView, withOffset:-5)
        self.singleQueueView.ticketTimeLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        self.singleQueueView.ticketTimeLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        
        
        self.singleQueueView.ticketImageView.autoCenterInSuperview()
        self.singleQueueView.ticketImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        self.singleQueueView.ticketImageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        let imageView = self.singleQueueView.ticketImageView
        let imageViewSize = imageView.image!.size
        self.singleQueueView.ticketImageView.autoSetDimension(.Height, toSize: imageViewSize.height)
        
        applyConstrainsToLabelsInsideTicker()
        
        self.singleQueueView.refreshButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.singleQueueView.ticketImageView, withOffset: 60)
        self.singleQueueView.refreshButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        self.singleQueueView.refreshButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        self.singleQueueView.refreshButton.autoSetDimensionsToSize(refreshButtonSize())
    }
    
    private func applyConstrainsToLabelsInsideTicker() {
        let view = self.singleQueueView
        view.ticketTitleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset:20)
        view.ticketTitleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 15)
        view.ticketTitleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 15)
        
        view.ticketHandledLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: view.ticketTitleLabel, withOffset: 2)
        view.ticketHandledLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        
        view.ticketCurrentNumberLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: view.ticketHandledLabel, withOffset: 5)
        view.ticketCurrentNumberLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        
        view.peopleInQueueValueField.autoPinEdge(.Top, toEdge: .Bottom, ofView: view.ticketCurrentNumberLabel, withOffset: 5)
        view.peopleInQueueValueField.autoAlignAxisToSuperviewAxis(.Vertical)
        
        view.numberOfHandlersValueField.autoPinEdge(.Top, toEdge: .Bottom, ofView: view.peopleInQueueValueField, withOffset: 2)
        view.numberOfHandlersValueField.autoAlignAxisToSuperviewAxis(.Vertical)
        
        view.averageTimeValueField.autoPinEdge(.Top, toEdge: .Bottom, ofView: view.numberOfHandlersValueField, withOffset: 2)
        view.averageTimeValueField.autoAlignAxisToSuperviewAxis(.Vertical)
    }
    
    func refreshButtonSize() -> CGSize {
        let buttonWidth = refreshButtonWidth()
        let size = CGSizeMake(buttonWidth, 50)
        return size
    }
    
    
    private func refreshButtonWidth() -> CGFloat {
        let totalScreenWidth = UIScreen.mainScreen().bounds.width
        let totalHorizontalSpacings = CGFloat(2 * 20)
        let buttonWidth = (totalScreenWidth - totalHorizontalSpacings)
        return buttonWidth
    }
}