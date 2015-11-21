//
//  DetailVC.swift
//  SwiftyExpandingCells
//
//  Created by Fischer, Justin on 11/19/15.
//  Copyright © 2015 Fischer, Justin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var iconLabel: UILabel!
    
    var brand: Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    func setup() {
        self.view.frame.origin.y = UIApplication.sharedApplication().statusBarFrame.size.height
        
        if let brand = self.brand {
            self.title = brand.name
            
            self.iconLabel.text = brand.iconText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

