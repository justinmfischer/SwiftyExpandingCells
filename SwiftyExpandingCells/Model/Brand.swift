//
//  Brand.swift
//  SwiftyExpandingCells
//
//  Created by Fischer, Justin on 11/19/15.
//  Copyright © 2015 Fischer, Justin. All rights reserved.
//

import Foundation
import UIKit

class Brand {
    var iconText: String
    var name: String
    
    init(iconText: String, name: String) {
        self.iconText = iconText
        self.name = name
    }
}

class BrandManager {
    static var sharedInstance = BrandManager()
    var brands = [Brand]()
    
    init() {
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.Apple), name: "Apple inc."))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.Github), name: "Github"))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.Slack), name: "Slack"))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.Bitbucket), name: "Bit Bucket"))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.Reddit), name: "Reddit"))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.HackerNews), name: "Hacker News"))
        self.brands.append(Brand(iconText: String.fontAwesomeIconWithName(FontAwesome.StackExchange), name: "Stack Exchange"))
    }
}