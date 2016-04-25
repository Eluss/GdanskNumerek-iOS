//
//  GroupView.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

protocol QueuesViewDelegate: class {
    func queuesView(queuesView: QueuesView, didSelectQueueWithIndex index: Int)
}

class QueuesView: UIView {
    
    private(set) var queuesDataSource: QueuesDataSource!
    private(set) var scrollView: UIScrollView!
    private(set) var stackView: UIStackView!
    private(set) var buttons: [QueueButton]!
    private(set) var instructionLabel: UILabel!
    private var queueNameExtractor = QueueNameExtractor()
    private var queuesViewLayout: QueuesViewLayout!
    
    weak var delegate: QueuesViewDelegate?
    
    init(queuesViewLayout: QueuesViewLayout, dataSource: QueuesDataSource) {
        super.init(frame: CGRectZero)
        self.queuesDataSource = dataSource
        self.queuesViewLayout = queuesViewLayout
        self.queuesViewLayout.queuesView = self
        setupView()
        self.queuesViewLayout.addViewsToSubview()
        self.queuesViewLayout.applyConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.whiteColor()
        setupBackgroundGradient()
        createScrolledStackView()
        createInstructionLabel()
        createButtons()
    }
    
    private func createInstructionLabel() {
        self.instructionLabel = UILabel()
        self.instructionLabel.textAlignment = .Center
        self.instructionLabel.textColor = UIColor.blackColor()
        self.instructionLabel.text = "Wybierz kolejkę z podanej listy:"
    }
    
    private func createButtons() {
        self.buttons = [QueueButton]()
        if let queues = self.queuesDataSource.queues {
            for (index, queue) in queues.enumerate() {
                var letter = ""
                if let queueLetter = queue.letter {
                    letter = queueLetter
                }
                var title = ""
                if let name = queue.name {
                    title = self.queueNameExtractor.extractQueueName(name)
                }
                let size = self.queuesViewLayout.queueButtonSize()
                let button = QueueButton(letter: letter, title: title.lowercaseString, size: size, index: index)
                button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
                
                self.buttons.append(button)
            }
        }
        
    }
    
    func didTapButton(sender: QueueButton) {
        self.delegate?.queuesView(self, didSelectQueueWithIndex: sender.index)
    }
    
    private func createScrolledStackView() {
        self.scrollView = UIScrollView()
        self.stackView = UIStackView()
        self.stackView.distribution = .EqualSpacing
        self.stackView.axis = .Vertical
        self.stackView.alignment = .Center
        self.stackView.spacing = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}