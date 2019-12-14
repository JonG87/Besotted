//
//  LiquerDetailViewController.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-12-13.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit

class LiquerDetailViewController: UIViewController {

    var id = String()
    var descriptionPlain = String()
    var name = String()
    var glass = String()
    var ingredients = [Ingredients]()
    
    var lightBlue = UIColor(red: 240.0/255.0, green: 248.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        // Do any additional setup after loading the view.
    }
    

    func createUI() {
        
        let cocktailName = UILabel()
        cocktailName.text = name
        cocktailName.font = UIFont.preferredFont(forTextStyle: .footnote)
        cocktailName.font = UIFont.boldSystemFont(ofSize: 30)
        cocktailName.textColor = .red
        cocktailName.textAlignment = .center
        view.addSubview(cocktailName)
        cocktailName.translatesAutoresizingMaskIntoConstraints = false
        cocktailName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cocktailName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        let cocktailImage = UIImageView()
        cocktailImage.image = UIImage(named: id)
        view.addSubview(cocktailImage)
        cocktailImage.layer.masksToBounds = true
        cocktailImage.layoutIfNeeded()
        cocktailImage.translatesAutoresizingMaskIntoConstraints = false
        cocktailImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cocktailImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        cocktailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cocktailImage.topAnchor.constraint(equalTo: cocktailName.bottomAnchor).isActive = true
        
        let cocktailDesc = UILabel()
        cocktailDesc.text = descriptionPlain
        cocktailDesc.backgroundColor = lightBlue
        cocktailDesc.layer.cornerRadius = 5
        cocktailDesc.lineBreakMode = .byWordWrapping
        cocktailDesc.numberOfLines = 3
        view.addSubview(cocktailDesc)
        cocktailDesc.translatesAutoresizingMaskIntoConstraints = false
        cocktailDesc.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cocktailDesc.topAnchor.constraint(equalTo: cocktailImage.bottomAnchor).isActive = true
        cocktailDesc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        cocktailDesc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
            
        let cocktailGlass = UILabel()
        cocktailGlass.text = "Served in: " + glass
        cocktailGlass.backgroundColor = lightBlue
        view.addSubview(cocktailGlass)
        cocktailGlass.translatesAutoresizingMaskIntoConstraints = false
        cocktailGlass.topAnchor.constraint(equalTo: cocktailDesc.bottomAnchor, constant: 15).isActive = true
        cocktailGlass.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    }
}
