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
        
        UIView.animateWithDuration(5.0, delay: 0.0, options: [], animations: { 
            var labelFrame = self.crawlLabel.frame
            labelFrame.origin.y += labelFrame.size.height
            self.crawlLabel.frame = labelFrame
            }, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let film = film  else {
            return
        }
        
        crawlLabel.text = film.openingCrawl
        
        crawlLabel.frame.origin.y -= self.imageView.frame.size.height
        
        UIView.animateWithDuration(7.0, delay: 0.5, options: [], animations: {
            var labelFrame = self.crawlLabel.frame
            labelFrame.origin.y -= labelFrame.size.height
            self.crawlLabel.frame = labelFrame
            }, completion: nil)
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
