//
//  SearchQuery.swift
//  NasaGram
//
//  Created by Selcuk on 28.10.2020.
//

import Foundation

struct SearchQuery: Decodable {
    
    
    let title: String
    let hdurl: String
    let copyright: String
    let description:String
    let date: String
}
