//
//  Film.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit
import Gloss
import Alamofire

class Film: Decodable {
    let title: String
    let episode: Int
    let openingCrawl: String
    
    required init?(json: JSON) {
        guard let title: String = "title" <~~ json, let episode: Int = "episode_id" <~~ json, let openingCrawl: String = "opening_crawl" <~~ json else {
            return nil
        }
        
        self.title = title
        self.episode = episode
        self.openingCrawl = openingCrawl
    }

}
