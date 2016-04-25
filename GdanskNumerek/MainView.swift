//
//  MainView.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 27/02/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

protocol MainViewDelegate: class {
    func mainView(mainView: MainView, didTapDivisionButton button: DivisionButton)
}

class MainView: UIView, UITableViewDelegate {
    weak var delegate: MainViewDelegate?
    private(set) var viewLayout: MainViewLayout!
    
    private(set) var chooseDivisionLabel: UILabel!
    private(set) var street1Button: DivisionButton!
    private(set) var street2Button: DivisionButton!
    private(set) var street3Button: DivisionButton!
    private(set) var street4Button: DivisionButton!
    private(set) var firstUnderline: UIView!
    private(set) var secondUnderline: UIView!
    private(set) var infoLabel: UILabel!
    private(set) var infoLabelLeftBorder: UIView!
    private(set) var infoLabelTopBorder: UIView!
    private(set) var bipImageView: UIImageView!
    private(set) var gdanskImageView: UIImageView!
    
    init(viewLayout: MainViewLayout) {
        super.init(frame: CGRectZero)
        self.viewLayout = viewLayout
        createComponents()
        
        self.viewLayout.mainView = self
        self.viewLayout.applyConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createComponents() {
        setupBackgroundGradient()
        createButtonsSection()
        createUnderlines()
        createInfoSection()
        createBottomLogos()
    }
    
    private func createButtonsSection() {
        self.chooseDivisionLabel = createChooseDivisionLabel()
        
        let street1ButtonTitle = "Zespół obsługi\n mieszkańców nr 1\n ul. Partyzantów 74"
        self.street1Button = createButton(street1ButtonTitle, dataSource: QueuesDataSourceProvider.zom1DataSource())
        self.street1Button.applyRedStyle()
        
        let street2ButtonTitle = "Zespół obsługi\n mieszkańców nr 2\n ul. Milskiego 1"
        self.street2Button = createButton(street2ButtonTitle, dataSource: QueuesDataSourceProvider.zom2DataSource())
        self.street2Button.applyGrayStyle()
        
        let street3ButtonTitle = "Zespół obsługi\n mieszkańców nr 3\n ul. Nowe Ogrody 8/12"
        self.street3Button = createButton(street3ButtonTitle, dataSource: QueuesDataSourceProvider.zom3DataSource())
        self.street3Button.applyGrayStyle()
        
        let street4ButtonTitle = "Zespół obsługi\n mieszkańców nr 4\n ul. Wilanowska 2"
        self.street4Button = createButton(street4ButtonTitle, dataSource: QueuesDataSourceProvider.zom4DataSource())
        self.street4Button.applyRedStyle()
    }
    
    private func createUnderlines() {
        self.firstUnderline = UIView.createViewWithShadow(UIColor.grayColor())
        self.secondUnderline = UIView.createViewWithShadow(UIColor.grayColor())
    }
    
    private func createBottomLogos() {
        self.bipImageView = UIImageView(image: UIImage(named: "bip")!)
        self.gdanskImageView = UIImageView(image: UIImage(named:"logo-color")!)
    }
    
    private func createInfoSection() {
        let text = "Szanowni Państwo, powyżej prezentujemy aktualny wykaz obsługiwanych biletów przez pracowników Urzędu Miejskiego w Gdańsku w wybranym Zespole Obsługi Mieszkańców (ZOM). Czas obsługi danego numeru jest wartością orientacyjną wyliczoną na podstawie ilości oczekujących klientów."
        self.infoLabel = LabelStyles.infoParagraphLabel(UILabel(), withText: text)
        
        self.infoLabelTopBorder = UIView.createViewWithShadow(UIColor.grayColor())
        self.infoLabelLeftBorder = UIView.createViewWithShadow(UIColor.grayColor())
    }
    
    private func createChooseDivisionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.textColor = UIColor.blackColor()
        label.text = "Wybierz zespół obsługi z podanych poniżej:"
        return label
    }
    
    private func createButton(title: String, dataSource: QueuesDataSource) -> DivisionButton {
        let size = self.viewLayout.divisionButtonSize()
        let button = DivisionButton(title: title, size: size, dataSource: dataSource)
        button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        return button
    }
    
    func didTapButton(sender: DivisionButton) {
        self.delegate?.mainView(self, didTapDivisionButton: sender)
    }
}