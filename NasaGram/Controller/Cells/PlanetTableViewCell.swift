//
//  PlanetTableViewCell.swift
//  NasaGram
//
//  Created by Selcuk on 23.10.2020.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    static let identifier = "PlanetTableViewCell"
    @IBOutlet var planetLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
