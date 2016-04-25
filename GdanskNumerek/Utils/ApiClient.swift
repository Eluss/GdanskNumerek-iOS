//
//  ApiClient.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 29/02/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

enum Endpoint: String {
    case EndpointZOM1 = "http://www.gdansk.pl/urzad/download/dane-otwarty-gdansk/qmatic-zom0.xml"
    case EndpointZOM2 = "http://www.gdansk.pl/urzad/download/dane-otwarty-gdansk/qmatic-zom1.xml"
    case EndpointZOM3 = "http://www.gdansk.pl/urzad/download/dane-otwarty-gdansk/qmatic-zom2.xml"
    case EndpointZOM4 = "http://www.gdansk.pl/urzad/download/dane-otwarty-gdansk/qmatic-zom3.xml"
}

class ApiClient: NSObject {
    
    static let sharedInstance = ApiClient()
    
    func numbers(endpoint: Endpoint, completion: (queues: [Queue]?, error: NSError?) -> Void){
        if !Reachability.isConnectedToNetwork() {
            let error = NSError(domain: "Brak połączenia z internetem", code: 509, userInfo: nil)
            completion(queues: nil, error: error)
        } else {
            Alamofire.request(.GET, endpoint.rawValue, parameters: nil)
                .response { (request, response, data, error) in
                    if let _ = error {
                        let error = NSError(domain: "Nie możemy się połączyć z serwerem", code: 510, userInfo: nil)
                        completion(queues: nil, error: error)
                        return
                    }
                    let xml = SWXMLHash.parse(data!)
                    let queues = self.queuesFromXML(xml)
                    completion(queues: queues, error: nil)
            }
        }
    }
    
    private func queuesFromXML(xml: XMLIndexer) -> [Queue] {
        var queues = [Queue]()
        for root in xml.children {
            for element in root.children {
                if self.queueExists(element) {
                    let number = Queue(element: element)
                    queues.append(number)
                }
            }
        }
        return queues
    }
    
    private func queueExists(element: XMLIndexer) -> Bool{
        if let name = element["NAZWAGRUPY"].element?.text {
            return !name.isEmpty
        }
        return false
    }
    
    
    
}