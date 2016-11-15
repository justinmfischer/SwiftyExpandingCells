//
//  MasterVC.swift
//  SwiftyExpandingCells
//
//  Created by Fischer, Justin on 11/19/15.
//  Copyright © 2015 Fischer, Justin. All rights reserved.
//

import UIKit

class MasterVC: UITableViewController, UINavigationControllerDelegate, SegueHandlerType {
    let transtition = SwiftyExpandingTransition()
    var selectedCellFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var selectedBrand: Brand?
    
    enum SegueIdentifier: String {
        case DetailVC = "DetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BrandManager.sharedInstance.brands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brand = BrandManager.sharedInstance.brands[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "brand") {
            cell.textLabel?.text = brand.iconText
            cell.detailTextLabel?.text = brand.name
            
            return cell
        }
        
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCellFrame = tableView.convert(tableView.cellForRow(at: indexPath)!.frame, to: tableView.superview)
        self.selectedBrand = BrandManager.sharedInstance.brands[indexPath.row]
        
        self.performSegueWithIdentifier(.DetailVC , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierForSegue(segue) {
            case .DetailVC:
                let vc = segue.destination as! DetailVC
                    vc.brand = self.selectedBrand
                
                self.navigationController?.delegate = self
        }
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == UINavigationControllerOperation.push {
            transtition.operation = UINavigationControllerOperation.push
            transtition.duration = 0.40
            transtition.selectedCellFrame = self.selectedCellFrame
            
            return transtition
        }
        
        if operation == UINavigationControllerOperation.pop {
            transtition.operation = UINavigationControllerOperation.pop
            transtition.duration = 0.20
            
            return transtition
        }
        
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

