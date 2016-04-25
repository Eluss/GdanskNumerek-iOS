//
//  TitledValueView.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 07/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class TitledValueView: UIView {
    
    private var title: String!
    private var value: String!
    private var valueLabel: UILabel!
    
    init(title: String, value: String) {
        super.init(frame: CGRectZero)
        self.title = title
        self.value = value
        setupView()
        addViewsToSubview()
        applyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.valueLabel = UILabel()
        self.valueLabel.textAlignment = .Center
        self.valueLabel.attributedText = attributedText()
    }
    
    private func addViewsToSubview() {
        self.addSubview(self.valueLabel)
    }
    
    private func applyConstraints() {
        self.valueLabel.autoPinEdgesToSuperviewEdges()
    }
    
    func applyValue(value: String) {
        self.value = value
        self.valueLabel.attributedText = attributedText()
    }
    
    private func attributedText() -> NSMutableAttributedString {
        let mixedText = self.title + " " + self.value
        let attributedTitle = NSMutableAttributedString(string: mixedText)
        let titleRange = NSMakeRange(0, self.title.characters.count)
        attributedTitle.addAttributes([NSFontAttributeName:UIFont.standardFontWithSize(12)], range: titleRange)
        let valueRange = NSMakeRange(self.title.characters.count , self.value.characters.count + 1)
        attributedTitle.addAttributes([NSFontAttributeName:UIFont.boldFontWithSize(12)], range: valueRange)
        attributedTitle.addAttributes([NSForegroundColorAttributeName: UIColor.blackTextColor()], range: NSMakeRange(0, title.characters.count))
        return attributedTitle
    }
}