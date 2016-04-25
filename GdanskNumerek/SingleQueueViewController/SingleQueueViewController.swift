//
//  SingleQueueViewController.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class SingleQueueViewController: UIViewController, SingleQueueViewDelegate{
    
    private var dataSource: QueuesDataSource!
    private var mainView: SingleQueueView!
    private var queueIndex: Int!
    private var singleQueueViewLayout: SingleQueueViewLayout!
    
    init(queueIndex: Int, dataSource: QueuesDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
        self.queueIndex = queueIndex
        self.title = ""
        setupAttributedTitle("Numerek")
        setupViewController()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewController() {
        self.singleQueueViewLayout = SingleQueueViewLayout()
        self.mainView = SingleQueueView(singleQueueViewLayout: self.singleQueueViewLayout)
        if let queue = self.dataSource.queues?[queueIndex] {
            self.mainView.applyModel(queue)
        }
        self.mainView.delegate = self
        self.view.addSubview(self.mainView)
        self.mainView.autoPinEdgesToSuperviewEdges()        
    }
    
    private func refreshNumbers() {
        loadQueuesFromDataSource(self.dataSource) { (queues, error) -> Void in
            if let queues = queues {
                let queue = queues[self.queueIndex]
                self.mainView.applyModel(queue)
                self.mainView.refreshLastUpdateTime()
            } else {
                self.showError(error)
                
            }
        }
    }
    
    private func showError(error: NSError?) {
        if let error = error {
            SimpleAlert.showSimpleAlertWithTitle("Przepraszamy", errorMessage: error.domain)
        } else {
            SimpleAlert.showSimpleAlertWithTitle("Przepraszamy", errorMessage: "Nieznany błąd")
        }
    }
    
    private func loadQueuesFromDataSource(dataSource: QueuesDataSource, completion: ([Queue]? ,NSError?) -> Void) {
        self.mainView.showLoader()
        dataSource.loadQueues { (queues, error) -> () in
            self.mainView.hideLoader()
            completion(queues, error)
        }
    }
    
    func singleQueueView(singleQueueView: SingleQueueView, didTappRefreshButton button: RefreshButton) {
        refreshNumbers()
    }

}