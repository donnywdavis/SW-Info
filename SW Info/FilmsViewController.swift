//
//  FilmsViewController.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    
    let transition = PopAnimator()
    var films: [Film]?
    var filmsWrapper: FilmsWrapper?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        loadFilms()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFilms() {
        FilmsWrapper.getFilms { (filmsWrapper, error) in
            guard error == nil else {
                return
            }
            
            self.filmsWrapper = filmsWrapper
            self.films = filmsWrapper?.results
            self.films?.sortInPlace({ $0.episode < $1.episode })
            self.activityIndicator.stopAnimating()
            self.tableView?.reloadData()
        }
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CrawlSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow, let film = films?[indexPath.row] else {
                return
            }

            guard let crawlVC = segue.destinationViewController as? FilmCrawlViewController else {
                return
            }
            
            crawlVC.film = film
        }
    }
    
    // MARK: Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let films = films else {
            return 0
        }
        
        return films.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("FilmCell", forIndexPath: indexPath) as? FilmsTableViewCell else {
            return UITableViewCell()
        }
        
        if let numberOfFilms = films?.count where numberOfFilms >= indexPath.row {
            if let film: Film = films?[indexPath.row] {
                cell.setupCell(film)
            }
        }
        
        return cell
    }
    
    // MARK: Screen Edge Gesture Actions
    
    @IBAction func screenEdgeGestureAction(sender: UIScreenEdgePanGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
