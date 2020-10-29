//
//  UIImageViewExtension.swift
//  NasaGram
//
//  Created by Selcuk on 18.10.2020.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imageUrl:String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
