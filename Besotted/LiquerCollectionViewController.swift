//
//  LiquerCollectionViewController.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-12-07.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//
import UIKit

private let reuseIdentifier = "LiquerCell"

class LiquerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var liquerType = String()
    let jsonparser = JsonParser()
    var cocktails: [Cocktail] = []
    var cocktailLiquerType: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        
        cocktails = jsonparser.returnJsonAsCocktailArray()
        
        for cocktail in cocktails{
            if (cocktail.ingredients[1].type == liquerType) {
                cocktailLiquerType.append(cocktail)
            }
        }
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView!.register(LiquerCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 2, height: collectionView.frame.width/2 + 50)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return cocktailLiquerType.count
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktailLiquerType.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LiquerCollectionViewCell
        cell.titleLabel.text = cocktailLiquerType[indexPath.row].name
        cell.bg.image = UIImage(named: cocktailLiquerType[indexPath.row].id)
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    

}
