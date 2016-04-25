//
//  NumberGroup.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 03/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import SWXMLHash

class Queue: NSObject {
    private(set) var id: String?
    private(set) var letter: String?
    private(set) var name: String?
    private(set) var currentNumber: String?
    private(set) var peopleInQueue: String?
    private(set) var activeHandlers: String?
    private(set) var handlingTime: String?
    
    init(element: XMLIndexer) {
        super.init()
        parseElement(element)
        
    }
    
    func parseElement(element: XMLIndexer) {
        self.id = element["IDGRUPY"].element?.text
        self.letter = element["LITERAGRUPY"].element?.text
        self.name = element["NAZWAGRUPY"].element?.text
        self.currentNumber = element["AKTUALNYNUMER"].element?.text
        self.peopleInQueue = element["LICZBAKLWKOLEJCE"].element?.text
        self.activeHandlers = element["LICZBACZYNNYCHSTAN"].element?.text
        self.handlingTime = element["CZASOBSLUGI"].element?.text
    }
}