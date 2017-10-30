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
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.apple), name: "Apple inc."))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.github), name: "Github"))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.slack), name: "Slack"))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.bitbucket), name: "Bit Bucket"))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.reddit), name: "Reddit"))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.hackerNews), name: "Hacker News"))
        self.brands.append(Brand(iconText: String.fontAwesomeIcon(name: FontAwesome.stackExchange), name: "Stack Exchange"))
    }
}
