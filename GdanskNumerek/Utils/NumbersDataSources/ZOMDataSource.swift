//
//  ZOM1DataSource.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation



class ZOMDataSource: NSObject, QueuesDataSource {
    
    private(set) var endpoint: Endpoint!
    var queues: [Queue]?
    
    init(endpoint: Endpoint) {
        super.init()
        self.endpoint = endpoint
    }
    
    func loadQueues(completion: (([Queue]?, NSError?) -> ())?) {
        ApiClient.sharedInstance.numbers(self.endpoint) { (queues, error) -> Void in
            self.queues = queues
            if let completion = completion {
                completion(queues, error)
            }
        }
    }
}