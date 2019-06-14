//
//  DetailViewController.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-06-02.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var id = String()
    var descriptionPlain = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        // Do any additional setup after loading the view.
    }
    

    func createUI() {
        let cocktailImage = UIImageView()
        cocktailImage.image = UIImage(named: id)
        view.addSubview(cocktailImage)
        cocktailImage.layer.masksToBounds = true
        cocktailImage.layoutIfNeeded()
        cocktailImage.translatesAutoresizingMaskIntoConstraints = false
        cocktailImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cocktailImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        cocktailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cocktailImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        let cocktailDesc = UILabel()
        cocktailDesc.text = descriptionPlain
        view.addSubview(cocktailDesc)
        cocktailDesc.translatesAutoresizingMaskIntoConstraints = false
        cocktailDesc.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cocktailDesc.topAnchor.constraint(equalTo: cocktailImage.bottomAnchor).isActive = true
        cocktailDesc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        cocktailDesc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        print(cocktailDesc.text!)
    }
    
    
    
    
    /*
    
     whiskyImage.layer.masksToBounds = true
     whiskyImage.layoutIfNeeded()
     whiskyLabel.translatesAutoresizingMaskIntoConstraints = false
     whiskyImage.translatesAutoresizingMaskIntoConstraints = false
     whiskyImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
     whiskyImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
     whiskyImage.topAnchor.constraint(equalTo: vodkaImage.bottomAnchor, constant: 10).isActive = true
     whiskyImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
     whiskyLabel.centerXAnchor.constraint(equalTo: whiskyImage.centerXAnchor).isActive = true
     whiskyLabel.centerYAnchor.constraint(equalTo: whiskyImage.centerYAnchor).isActive = true
    */

}
