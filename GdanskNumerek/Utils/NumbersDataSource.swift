//
//  NumbersDataSource.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation

protocol QueuesDataSource {
    var queues: [Queue]? { get }
    
    func loadQueues(completion: (([Queue]?, NSError?) -> ())?)
}