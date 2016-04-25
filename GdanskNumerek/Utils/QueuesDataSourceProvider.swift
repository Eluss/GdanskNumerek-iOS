//
//  NumbersDataSourceProvider.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation

class QueuesDataSourceProvider {
    static func zom1DataSource() -> QueuesDataSource {
        let dataSource = ZOMDataSource(endpoint: .EndpointZOM1)
//        dataSource.loadQueues(nil)
        return dataSource
    }
    
    static func zom2DataSource() -> QueuesDataSource {
        let dataSource = ZOMDataSource(endpoint: .EndpointZOM2)
//        dataSource.loadQueues(nil)
        return dataSource
    }
    
    static func zom3DataSource() -> QueuesDataSource {
        let dataSource = ZOMDataSource(endpoint: .EndpointZOM3)
//        dataSource.loadQueues(nil)
        return dataSource
    }

    static func zom4DataSource() -> QueuesDataSource {
        let dataSource = ZOMDataSource(endpoint: .EndpointZOM4)
//        dataSource.loadQueues(nil)
        return dataSource
    }
}