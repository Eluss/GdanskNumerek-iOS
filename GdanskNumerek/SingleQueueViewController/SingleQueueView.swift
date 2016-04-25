//
//  SingleQueueView.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

protocol SingleQueueViewDelegate: class {
    func singleQueueView(singleQueueView: SingleQueueView, didTappRefreshButton button: RefreshButton)
}

class SingleQueueView: UIView {

    weak var delegate: SingleQueueViewDelegate?
    
    private(set) var infoLabel: UILabel!
    private(set) var ticketImageView: UIImageView!
    
    private(set) var ticketTitleLabel: UILabel!
    private(set) var ticketHandledLabel: UILabel!
    private(set) var ticketCurrentNumberLabel: UILabel!
    private(set) var peopleInQueueValueField: TitledValueView!
    private(set) var numberOfHandlersValueField: TitledValueView!
    private(set) var averageTimeValueField: TitledValueView!
    private(set) var ticketTimeLabel: UILabel!
    private(set) var refreshButton: RefreshButton!
    
    
    private var singleQueueViewLayout: SingleQueueViewLayout!
    
    init(singleQueueViewLayout: SingleQueueViewLayout) {
        super.init(frame: CGRectZero)
        self.singleQueueViewLayout = singleQueueViewLayout
        self.singleQueueViewLayout.singleQueueView = self
        setupView()
        self.singleQueueViewLayout.addViewsToSubview()
        self.singleQueueViewLayout.applyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupBackgroundGradient()
        createInfoLabel()
        createTicketTitleLabel()
        createHandledTicketNumberLabel()
        createTicketImageView()
        createValueFields()
        createTicketTimeLabel()
        createRefreshButton()
    }
    
    private func createRefreshButton() {
        let size = self.singleQueueViewLayout.refreshButtonSize()
        self.refreshButton = RefreshButton(size: size)
        self.refreshButton.addTarget(self, action: "refresh:", forControlEvents: .TouchUpInside)
    }
    
    private func createTicketTimeLabel() {
        self.ticketTimeLabel = LabelStyles.ticketTimeLabel(UILabel())
        refreshLastUpdateTime()
    }
    
    private func createTicketTitleLabel() {
        self.ticketTitleLabel = LabelStyles.ticketTitleLabel(UILabel())
        self.ticketTitleLabel.text =  "Tytuł wydziału"
    }
    
    private func createValueFields() {
        self.peopleInQueueValueField = TitledValueView(title: "Osób w kolejce:", value: "0")
        self.numberOfHandlersValueField = TitledValueView(title: "Liczba stanowisk:", value: "0")
        self.averageTimeValueField = TitledValueView(title: "Średni czas obsługi:", value: "0 min")
    }
    
    private func createHandledTicketNumberLabel() {
        self.ticketHandledLabel = LabelStyles.titledValueTitleLabel(UILabel())
        self.ticketHandledLabel.text = "Obsługiwany numerek"
        self.ticketCurrentNumberLabel = LabelStyles.currentNumberLabel(UILabel())
        self.ticketCurrentNumberLabel.text = "..."
    }
    
    private func createInfoLabel() {
        let text = "Poniżej znajdują się informacje, odnośnie aktualnie obsługiwanego numerka."
        self.infoLabel = LabelStyles.numberInfoLabel(UILabel())
        let attributedText = NSMutableAttributedString.stringWithText(text, spacingBetweenLines: 5, textAlignment: .Center)
        self.infoLabel.attributedText = attributedText
    }
    
    private func createTicketImageView() {
        let ticketImage = UIImage(named: "ticket")
        self.ticketImageView = UIImageView(image: ticketImage)
    }
    
    func applyModel(queue: Queue) {
        self.ticketTitleLabel.text = queue.name!
        self.ticketCurrentNumberLabel.text = queue.letter!.uppercaseString + queue.currentNumber!
        self.peopleInQueueValueField.applyValue(queue.peopleInQueue!)
        self.numberOfHandlersValueField.applyValue(queue.activeHandlers!)
        self.averageTimeValueField.applyValue(queue.handlingTime! + " min")
    }
    
    func refreshLastUpdateTime() {
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let stringDate = dateFormatter.stringFromDate(date)
        let lastUpdateString = "Numerek został pobrany o godzinie: \(stringDate)"
        self.ticketTimeLabel.text = lastUpdateString
    }
    
    func refresh(sender: RefreshButton) {
        self.delegate?.singleQueueView(self, didTappRefreshButton: sender)
    }
}