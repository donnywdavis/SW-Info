//
//  MainViewController.swift
//  SW Info
//
//  Created by Donny Davis on 5/21/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    let endpoints = ["Films", "Characters", "Species"]

    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clear any unpopulated cells from displaying
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return endpoints.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("EndpointCell", forIndexPath: indexPath) as? MainTableViewCell else {
            let alert = UIAlertController(title: "Error", message: "Error loading table cell", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
            return UITableViewCell()
        }
        
        cell.setUpCell(endpoints[indexPath.row])
        
        return cell
    }


}

