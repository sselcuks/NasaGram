//
//  PhotosTableViewCell.swift
//  NasaGram
//
//  Created by Selcuk on 18.10.2020.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    @IBOutlet  weak var photosImageView: UIImageView!
    
    @IBOutlet private weak var photosTitleLabel: UILabel!
    
    var planet: Planets!{
        didSet{
            self.photosTitleLabel.text = self.planet.title
            self.photosImageView.setImage(imageUrl: self.planet.url)
          
        }
        
    }
    
}
