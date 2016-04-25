//
//  QueuesViewLayout.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 07/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class QueuesViewLayout: NSObject {
    
    weak var queuesView: QueuesView!
    
    func addViewsToSubview() {
        self.queuesView.addSubview(self.queuesView.scrollView)
        self.queuesView.scrollView.addSubview(self.queuesView.instructionLabel)
        self.queuesView.scrollView.addSubview(self.queuesView.stackView)
        for button in self.queuesView.buttons {
            self.queuesView.stackView.addArrangedSubview(button)
        }
        
    }
    
    func queueButtonSize() -> CGSize {
        let buttonWidth = queueButtonWidth()
        let size = CGSizeMake(buttonWidth, 50)
        return size
    }
    
    private func queueButtonWidth() -> CGFloat {
        let totalScreenWidth = UIScreen.mainScreen().bounds.width
        let totalHorizontalSpacings = CGFloat(2 * 20)
        let buttonWidth = (totalScreenWidth - totalHorizontalSpacings)
        return buttonWidth
    }
    
    func applyConstraints() {
        self.queuesView.instructionLabel.autoPinEdge(.Top, toEdge: .Top, ofView: self.queuesView.scrollView, withOffset: 35)
        self.queuesView.instructionLabel.autoPinEdge(.Left, toEdge: .Left, ofView: self.queuesView)
        self.queuesView.instructionLabel.autoPinEdge(.Right, toEdge: .Right, ofView: self.queuesView)
        
        self.queuesView.scrollView.autoPinEdgesToSuperviewEdges()
        self.queuesView.scrollView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.queuesView.stackView, withOffset: 10)
        
        self.queuesView.stackView.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.queuesView.instructionLabel, withOffset: 30)
        self.queuesView.stackView.autoPinEdge(.Left, toEdge: .Left, ofView: self.queuesView)
        self.queuesView.stackView.autoPinEdge(.Right, toEdge: .Right, ofView: self.queuesView)
        if let lastButton = self.queuesView.buttons.last {
            self.queuesView.stackView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: lastButton)
        } else {
            self.queuesView.stackView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.queuesView)
        }
        for button in self.queuesView.buttons {
            button.autoSetDimensionsToSize(queueButtonSize())
        }
    }
}