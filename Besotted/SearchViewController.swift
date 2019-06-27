//
//  SearchViewController.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-05-30.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var cocktails: [Cocktail] = []
    var cocktailSearch: [Cocktail] = []
    let jsonparser = JsonParser()
    let detailSegueID = "DetailSegue"
    let searchBar: UISearchBar = UISearchBar()
    var cocktailTableView: UITableView!
    var searchActive : Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Cocktail"

        cocktails = jsonparser.returnJsonAsCocktailArray()
        self.cocktailSearch = self.cocktails
        createTableView()
        self.hideKeyboardWhenTappedAround()
    }

    func createTableView() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        let searchBarHeight: CGFloat = 40
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: searchBarHeight)
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = .black
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        cocktailTableView = UITableView(frame: CGRect(x: 0, y: barHeight + searchBarHeight, width: displayWidth, height: displayHeight - barHeight - searchBarHeight))
        cocktailTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        cocktailTableView.dataSource = self
        cocktailTableView.delegate = self
        self.view.addSubview(cocktailTableView)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboardWhenTappedAround()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if let searchText = searchBar.text, !searchText.isEmpty {
            self.cocktailSearch = cocktailSearch.filter { cocktail in
                return (cocktail.name.lowercased().contains(searchText.lowercased()))
            }
        } else {
            self.cocktailSearch = self.cocktails
        }
        self.cocktailTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action: #selector(SearchViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!searchActive)
        {
            return cocktails.count
        }
        else
        {
            return cocktailSearch.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)

        if(!searchActive){
            cell.textLabel!.text = "\(cocktails[indexPath.row].name)"
            cell.imageView?.image = UIImage(named: cocktails[indexPath.row].id)
            cell.selectionStyle = .none
        }
        else
        {
            cell.textLabel!.text = "\(cocktailSearch[indexPath.row].name)"
            cell.imageView?.image = UIImage(named: cocktailSearch[indexPath.row].id)
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        self.performSegue(withIdentifier: "DetailSegue", sender: self)
    }
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailViewController
        let cocktailIndex = cocktailTableView.indexPathForSelectedRow?.row
        print(cocktailIndex as Any)
        if segue.identifier == detailSegueID {
            destination?.id = cocktails[cocktailIndex!].id
            destination?.descriptionPlain = cocktails[cocktailIndex!].descriptionPlain
        }
    }
}
