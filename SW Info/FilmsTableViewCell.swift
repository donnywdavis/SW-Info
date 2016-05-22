//
//  FilmsTableViewCell.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(film: Film) {
        episodeLabel.text = "Episode \(convertToRomanNumeral(film.episode))"
        titleLabel.text = film.title
    }
    
    func convertToRomanNumeral(episode: Int) -> String {
        var romanNumeral = ""
        let ones = "I"
        let fives = "V"
        let tens = "X"
        
        for number in 1...episode {
            switch number % 10 {
            case 1...3:
                romanNumeral += ones
            case 4:
                romanNumeral = ones + fives
            case 5:
                romanNumeral = fives
            case 6...8:
                romanNumeral += ones
            case 9:
                romanNumeral = ones + tens
            default:
                break
            }
        }
        return romanNumeral
    }

}
