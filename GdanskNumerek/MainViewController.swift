//
//  MainViewController.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 27/02/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MainViewController: UIViewController, MainViewDelegate {
    
    private var mainView: MainView!
    private var mainViewLayout: MainViewLayout!
    
    override func loadView() {
        super.loadView()
        setupNavigationBar()
        self.title = ""
        setupAttributedTitle("Biuletyn informacyjny")
        setupView()
    }
    
    private func setupView() {
        self.mainViewLayout = MainViewLayout()
        self.mainView = MainView(viewLayout: self.mainViewLayout)
        self.mainView.delegate = self
        self.view.addSubview(self.mainView)
        self.mainView.autoPinEdgesToSuperviewEdges()
    }
    
    func mainView(mainView: MainView, didTapDivisionButton button: DivisionButton) {
        let dataSource = button.dataSource
        if let _ = dataSource.queues {
            navigateToQueuesViewControllerWithDataSource(dataSource)
        } else {
            loadQueuesFromDataSource(dataSource, completion: { (queues, error) -> Void in
                if let _ = queues {
                    self.navigateToQueuesViewControllerWithDataSource(dataSource)
                } else {
                    self.showError(error)
                }
                
            })
        }
    }
    
    private func navigateToQueuesViewControllerWithDataSource(dataSource: QueuesDataSource) {
        let queuesViewController = QueuesViewController(dataSource: dataSource)
        self.navigationController?.pushViewController(queuesViewController, animated: true)
    }
    
    private func showError(error: NSError?) {
        if let error = error {
            SimpleAlert.showSimpleAlertWithTitle("Przepraszamy", errorMessage: error.domain)
        } else {
            SimpleAlert.showSimpleAlertWithTitle("Przepraszamy", errorMessage: "Nieznany błąd")
        }
    }
    
    private func loadQueuesFromDataSource(dataSource: QueuesDataSource, completion: ([Queue]?, NSError?) -> Void) {
        self.mainView.showLoader()
        dataSource.loadQueues { (queues, error) -> () in
            self.mainView.hideLoader()
            completion(queues, error)
        }
    }
    
}