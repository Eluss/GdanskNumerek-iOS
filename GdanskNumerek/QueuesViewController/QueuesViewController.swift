//
//  GroupViewController.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class QueuesViewController: UIViewController, QueuesViewDelegate {
    
    private var dataSource: QueuesDataSource!
    private var queuesView: QueuesView!
    private var queuesViewLayout: QueuesViewLayout!
    
    init(dataSource: QueuesDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
        self.title = ""
        setupAttributedTitle("Kolejki")
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.queuesViewLayout = QueuesViewLayout()
        self.queuesView = QueuesView(queuesViewLayout: self.queuesViewLayout ,dataSource: self.dataSource)
        self.queuesView.delegate = self
        self.view.addSubview(self.queuesView)
        self.queuesView.autoPinEdgesToSuperviewEdges()
    }
    
    func queuesView(queuesView: QueuesView, didSelectQueueWithIndex index: Int) {
        loadQueuesFromDataSource(self.dataSource) { (queues, error) -> Void in
            if let _ = queues {
                let singleQueueViewController = SingleQueueViewController(queueIndex: index, dataSource: self.dataSource)
                self.navigationController?.pushViewController(singleQueueViewController, animated: true)
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
    
    private func loadQueuesFromDataSource(dataSource: QueuesDataSource, completion: ([Queue]?, NSError?) -> Void) {
        self.queuesView.showLoader()
        dataSource.loadQueues { (queues, error) -> () in
            self.queuesView.hideLoader()
            completion(queues,error)
        }
    }
}