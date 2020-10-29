//
//  DetailViewController.swift
//  NasaGram
//
//  Created by Selcuk on 18.10.2020.
//

import Foundation
import UIKit

class DetailViewController: UIViewController,UITextViewDelegate{
    
    var planet: Planets!
    
    @IBOutlet private weak var labelText: UILabel!
    @IBOutlet private weak var detailImage: UIImageView!
    
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var descriptionTextHeight: NSLayoutConstraint!
    
  
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImage.setImage(imageUrl: self.planet.url)
        self.labelText.text = self.planet.title
        self.descriptionText.text = self.planet.description
        self.descriptionText.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let sizeToFitIn = CGSize(width: self.descriptionText.bounds.size.width, height: CGFloat(MAXFLOAT))
        let newSize = self.descriptionText.sizeThatFits(sizeToFitIn)
        self.descriptionTextHeight.constant = newSize.height
    }
    
    
}
