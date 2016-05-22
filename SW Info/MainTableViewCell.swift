//
//  MainTableViewCell.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var endpointLabel: UILabel!
    
    
    // MARK: View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(title: String) {
        endpointLabel.text = title
    }

}
