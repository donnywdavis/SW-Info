//
//  FilmsWrapper.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit
import Gloss
import Alamofire

class FilmsWrapper: Decodable {
    let results: [Film]?
    let count: Int?
    let next: String?
    let previous: String?
    
    required init?(json: JSON) {
        guard let results: [Film] = "results" <~~ json, let count: Int = "count" <~~ json else {
            return nil
        }
        
        self.results = results
        self.count = count
        self.next = "next" <~~ json
        self.previous = "previous" <~~ json
    }
    
    class func filmsEndpoint() -> String {
        return "https://swapi.co/api/films/"
    }
    
    class func getFilms(completionHandler: (FilmsWrapper?, NSError?) -> Void) {
        getFilmsAtPath(FilmsWrapper.filmsEndpoint(), completionHandler: completionHandler)
    }
    
    private class func getFilmsAtPath(path: String, completionHandler: (FilmsWrapper?, NSError?) -> Void) {
        let securePath = path.stringByReplacingOccurrencesOfString("http://", withString: "https://", options: .AnchoredSearch)
        Alamofire.request(.GET, securePath).responseJSON { (response) in
            guard response.result.error == nil else {
                completionHandler(nil, response.result.error)
                return
            }
            
            guard let result = response.result.value as? [String: AnyObject] else {
                completionHandler(nil, nil)
                return
            }
            
            if let filmsWrapper = FilmsWrapper(json: result) {
                completionHandler(filmsWrapper, response.result.error)
            } else {
                completionHandler(nil, nil)
            }
        }
    }
}
