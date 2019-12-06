//
//  CocktailPickerView.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-03-06.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit


class CocktailPickerView: UIPickerView {
    let jsonParser = JsonParser().returnJsonAsCocktailArray()
    var cocktails: [Cocktail] = []
}

extension CocktailPickerView: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cocktails.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print()
    }
}

extension CocktailPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 125
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        
        let cocktailImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 135))
        cocktailImage.image = UIImage(named: cocktails[row].id)
        view.addSubview(cocktailImage)
        
        let bottomLabel = UILabel(frame: CGRect(x: 0, y: 130, width: 100, height: 20))
        bottomLabel.text = cocktails[row].name
        bottomLabel.textAlignment = .center
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 17)
        bottomLabel.textColor = .red
        bottomLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(bottomLabel)
        
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi / 180)))
        return view
    }
}



/**
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 let destination = segue.destination as? DetailViewController
 let cocktailIndex = cocktailTableView.indexPathForSelectedRow?.row
 print(cocktailIndex as Any)
 if segue.identifier == detailSegueID {
 destination?.id = cocktails[cocktailIndex!].id
 destination?.descriptionPlain = cocktails[cocktailIndex!].descriptionPlain
 destination?.name = cocktails[cocktailIndex!].name
 destination?.glass = cocktails[cocktailIndex!].servedIn.text
 destination?.ingredients = cocktails[cocktailIndex!].ingredients
 **/

