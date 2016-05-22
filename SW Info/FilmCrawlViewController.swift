//
//  FilmCrawlViewController.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class FilmCrawlViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var crawlLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    
    var film: Film?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let film = film  else {
            return
        }
        
        crawlLabel.text = film.openingCrawl
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: [], animations: {
            var labelFrame = self.imageView.frame
            labelFrame.origin.y -= labelFrame.size.height
            self.crawlLabel.frame = labelFrame
            }, completion: nil)
//        crawlLabel.frame.origin.y -= view.frame.size.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Screen Edge Gesture Actions
    
    @IBAction func screenEdgelGestureAction(sender: UIScreenEdgePanGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
