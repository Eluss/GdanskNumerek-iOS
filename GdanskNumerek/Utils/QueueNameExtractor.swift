//
//  QueueNameLetterRemover.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation


class QueueNameExtractor: NSObject {
    
    func extractQueueName(name: String) -> String {
        if name.characters.count == 1 {
            return ""
        }
        let newName = name
        if let range = newName.rangeOfString("-") {
            let substring = newName.substringFromIndex(range.startIndex.advancedBy(1))
            let trimmedString = substring.stringByTrimmingCharactersInSet(
                NSCharacterSet.whitespaceAndNewlineCharacterSet()
            )
            return trimmedString
        }
        return name
        
    }
    
}