//
//  jsonParser.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-03-06.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import Foundation

class JsonParser {   
    func returnJsonAsCocktailArray() -> [Cocktail] {
        var cocktailArray: [Cocktail] = []
        if let path = Bundle.main.url(forResource: "Cocktails", withExtension: "json") {
            do {
                let data =  try Data(contentsOf: path)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Cocktails.self, from: data)
                for cocktail in jsonData.cocktails {
                    cocktailArray.append(cocktail)
                }
            } catch {
                print("error: \(error)")
            }
        }
        return cocktailArray
    }
}
