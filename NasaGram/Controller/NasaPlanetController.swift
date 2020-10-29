//
//  NasaPlanetController.swift
//  NasaGram
//
//  Created by Selcuk on 25.10.2020.
//

import Foundation
import UIKit

class NasaPlanetController: UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var nasaPlanetImage: UIImageView!
    @IBOutlet weak var nasaPlanetLabel: UILabel!
    @IBOutlet weak var nasaPlanetText: UITextView!
    @IBOutlet weak var nasaPlanetTextHeight: NSLayoutConstraint!
    
    var planetItems: InfoPlanet!
    
    override func viewDidLoad() {
        self.nasaPlanetImage.image = UIImage(named: planetItems.image)
        self.nasaPlanetLabel.text = self.planetItems.title
        self.nasaPlanetText.text = self.planetItems.description
        super.viewDidLoad()
      
    }
    
    // MARK -- Arrange text height
    
    func textViewDidChange(_ textView: UITextView) {
        let sizeToFitIn = CGSize(width: self.nasaPlanetText.bounds.size.width, height: CGFloat(MAXFLOAT))
        let newSize = self.nasaPlanetLabel.sizeThatFits(sizeToFitIn)
        self.nasaPlanetTextHeight.constant = newSize.height
    }
    
}
