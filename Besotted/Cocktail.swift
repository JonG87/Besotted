//
//  Cocktail.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-03-01.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import Foundation

struct Cocktails: Decodable {
    var cocktails: [Cocktail]
}

struct Cocktail: Decodable {
    var id:                 String
    var name:               String
    var descriptionPlain:   String
    var isAlcoholic:        Bool
    var isCarbonated:       Bool
    var isHot:              Bool
    var rating:             Double
    var servedIn:           ServedIn
    var actions:            [Actions]
    var videos:             [Videos]
    var ingredients:        [Ingredients]
    var tools:              [Tools]
}

struct Videos: Codable {
    var video:      String
    var type:       String
}

struct Actions: Codable {
    var id:         String
    var text:       String
}

struct ServedIn: Codable {
    var id:         String
    var text:       String
}

struct Ingredients: Codable {
    var id:         String
    var type:       String
    var textPlain:  String
}

struct Tastes: Codable {
    var id:         String
    var text:       String
}

struct Occasions: Codable {
    var id:         String
    var text:       String
}

struct Tools: Codable {
    var id:         String
    var text:       String
}
