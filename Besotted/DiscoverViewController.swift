//
//  DiscoverViewController.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-02-28.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit


class DiscoverViewController: UIViewController {

    var cocktails: [Cocktail] = []
    let jsonparser = JsonParser()
    var cocktailPickerView: CocktailPickerView! = nil
    var rotationAngle: CGFloat!
    var liquerType: String!
    let lcvc = LiquerCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 1000
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        //setupScrollView()
        //createUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        rotationAngle = -90 * (.pi/180)
        cocktails = jsonparser.returnJsonAsCocktailArray()
        cocktailPickerView = CocktailPickerView()
        cocktailPickerView.cocktails = cocktails
        createUI()
    }
    
    @objc func liquerImageTap(recognizer: UIGestureRecognizer) {
        switch recognizer.view?.tag {
        case 0:
            liquerType = "gin"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        case 1:
            liquerType = "vodka"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        case 2:
            liquerType = "tequila"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        case 3:
            liquerType = "whisky"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        case 4:
            liquerType = "rum"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        case 5:
            liquerType = "brandy"
            lcvc.liquerType = liquerType
            navigationController?.pushViewController(lcvc, animated: true)
        default:
            print("silly")
        }
    }
    
    func createUI() {
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let discoverLabel = UILabel()
        discoverLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        discoverLabel.font = UIFont.boldSystemFont(ofSize: 25)
        discoverLabel.textColor = .black
        discoverLabel.textAlignment = .center
        discoverLabel.text = "Discover"
        discoverLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(discoverLabel)
        discoverLabel.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        discoverLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let cocktailPicker = UIPickerView()
        cocktailPicker.delegate = cocktailPickerView
        cocktailPicker.dataSource = cocktailPickerView
        cocktailPicker.selectRow(3, inComponent: 0, animated: true)
        cocktailPicker.subviews[1].isHidden = true //Hides those grey bars on the UIPickerView
        cocktailPicker.subviews[2].isHidden = true
        
        cocktailPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        cocktailPicker.frame = CGRect(x:-250, y:50, width: view.frame.width + 500, height: 150) //fuzzy stuff going on here, play with numbers to get it where you want it because of CGAffineTransform
        scrollView.addSubview(cocktailPicker)
        let cocktailPickerY = cocktailPicker.frame.origin.y
        
        
                
        //Because of the rotation(CGAffineTransform) of the cocktail picker, we have to get cocktailPicker.frame.origin.y in order for the label to be underneath it directly.
        let baseLiquerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 125, y: cocktailPickerY + 175, width: 250, height: 30))
        baseLiquerLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        baseLiquerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        baseLiquerLabel.textColor = .black
        baseLiquerLabel.textAlignment = .center
        baseLiquerLabel.text = "Base Liquer"
        scrollView.addSubview(baseLiquerLabel)
        

        
        //Gin
        let ginImage = UIImageView()
        ginImage.layer.cornerRadius = 20
        ginImage.image = UIImage(named: "gin_juniper_berries")
        let ginLabel = UILabel()
        ginLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        ginLabel.font = UIFont.boldSystemFont(ofSize: 20)
        ginLabel.textColor = .white
        ginLabel.textAlignment = .center
        ginLabel.text = "Gin"
        ginImage.addSubview(ginLabel)
        scrollView.addSubview(ginImage)
        
        ginImage.isUserInteractionEnabled = true
        ginImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        ginImage.tag = 0
        ginImage.layer.masksToBounds = true
        ginImage.layoutIfNeeded()
        ginImage.translatesAutoresizingMaskIntoConstraints = false
        ginLabel.translatesAutoresizingMaskIntoConstraints = false
        ginImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ginImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
        ginImage.topAnchor.constraint(equalTo: baseLiquerLabel.bottomAnchor, constant: 15).isActive = true
        ginImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        ginLabel.centerXAnchor.constraint(equalTo: ginImage.centerXAnchor).isActive = true
        ginLabel.centerYAnchor.constraint(equalTo: ginImage.centerYAnchor).isActive = true
        
        
        //Vodka
        let vodkaImage = UIImageView()
        vodkaImage.layer.cornerRadius = 20
        vodkaImage.image = UIImage(named: "wheat_vodka")
        let vodkaLabel = UILabel()
        vodkaLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        vodkaLabel.font = UIFont.boldSystemFont(ofSize: 20)
        vodkaLabel.textColor = .white
        vodkaLabel.textAlignment = .center
        vodkaLabel.text = "Vodka"
        vodkaImage.addSubview(vodkaLabel)
        scrollView.addSubview(vodkaImage)
        
        vodkaImage.isUserInteractionEnabled = true
        vodkaImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        vodkaImage.tag = 1
        vodkaImage.layer.masksToBounds = true
        vodkaImage.layoutIfNeeded()
        vodkaLabel.translatesAutoresizingMaskIntoConstraints = false
        vodkaImage.translatesAutoresizingMaskIntoConstraints = false
        vodkaImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vodkaImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
        vodkaImage.topAnchor.constraint(equalTo: baseLiquerLabel.bottomAnchor, constant: 15).isActive = true
        vodkaImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        vodkaLabel.centerYAnchor.constraint(equalTo: vodkaImage.centerYAnchor).isActive = true
        vodkaLabel.centerXAnchor.constraint(equalTo: vodkaImage.centerXAnchor).isActive = true

        //Tequila
        let tequilaImage = UIImageView()
        tequilaImage.layer.cornerRadius = 20
        tequilaImage.image = UIImage(named: "agave_tequila")
        let tequilaLabel = UILabel()
        tequilaLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        tequilaLabel.font = UIFont.boldSystemFont(ofSize: 20)
        tequilaLabel.textColor = .white
        tequilaLabel.textAlignment = .center
        tequilaLabel.text = "Tequila"
        tequilaImage.addSubview(tequilaLabel)
        scrollView.addSubview(tequilaImage)
        
        tequilaImage.isUserInteractionEnabled = true
        tequilaImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        tequilaImage.tag = 2
        tequilaImage.layer.masksToBounds = true
        tequilaImage.layoutIfNeeded()
        tequilaLabel.translatesAutoresizingMaskIntoConstraints = false
        tequilaImage.translatesAutoresizingMaskIntoConstraints = false
        tequilaImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        tequilaImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
        tequilaImage.topAnchor.constraint(equalTo: ginImage.bottomAnchor, constant: 10).isActive = true
        tequilaImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        tequilaLabel.centerXAnchor.constraint(equalTo: tequilaImage.centerXAnchor).isActive = true
        tequilaLabel.centerYAnchor.constraint(equalTo: tequilaImage.centerYAnchor).isActive = true
        
        //Whisky
        let whiskyImage = UIImageView()
        whiskyImage.layer.cornerRadius = 20
        whiskyImage.image = UIImage(named: "barley_whisky")
        let whiskyLabel = UILabel()
        whiskyLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        whiskyLabel.font = UIFont.boldSystemFont(ofSize: 20)
        whiskyLabel.textColor = .white
        whiskyLabel.textAlignment = .center
        whiskyLabel.text = "Whisky"
        whiskyImage.addSubview(whiskyLabel)
        scrollView.addSubview(whiskyImage)
        
        whiskyImage.isUserInteractionEnabled = true
        whiskyImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        whiskyImage.tag = 3
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
        
        //Rum
        let rumImage = UIImageView()
        rumImage.layer.cornerRadius = 20
        rumImage.image = UIImage(named: "sugar_cane_rum")
        let rumLabel = UILabel()
        rumLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        rumLabel.font = UIFont.boldSystemFont(ofSize: 20)
        rumLabel.textColor = .white
        rumLabel.textAlignment = .center
        rumLabel.text = "Rum"
        rumImage.addSubview(rumLabel)
        scrollView.addSubview(rumImage)
        
        rumImage.isUserInteractionEnabled = true
        rumImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        rumImage.tag = 4
        rumImage.layer.masksToBounds = true
        rumImage.layoutIfNeeded()
        rumLabel.translatesAutoresizingMaskIntoConstraints = false
        rumImage.translatesAutoresizingMaskIntoConstraints = false
        rumImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rumImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
        rumImage.topAnchor.constraint(equalTo: tequilaImage.bottomAnchor, constant: 10).isActive = true
        rumImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        rumLabel.centerXAnchor.constraint(equalTo: rumImage.centerXAnchor).isActive = true
        rumLabel.centerYAnchor.constraint(equalTo: rumImage.centerYAnchor).isActive = true
        
        //Cognac
        let cognacImage = UIImageView()
        cognacImage.layer.cornerRadius = 20
        cognacImage.image = UIImage(named: "cognac_grapes")
        let cognacLabel = UILabel()
        cognacLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        cognacLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cognacLabel.textColor = .white
        cognacLabel.textAlignment = .center
        cognacLabel.text = "Cognac"
        cognacImage.addSubview(cognacLabel)
        scrollView.addSubview(cognacImage)
        
        cognacImage.isUserInteractionEnabled = true
        cognacImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(liquerImageTap)))
        
        cognacImage.tag = 5
        cognacImage.layer.masksToBounds = true
        cognacImage.layoutIfNeeded()
        cognacLabel.translatesAutoresizingMaskIntoConstraints = false
        cognacImage.translatesAutoresizingMaskIntoConstraints = false
        cognacImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cognacImage.widthAnchor.constraint(equalToConstant: (view.frame.width/2-15)).isActive = true
        cognacImage.topAnchor.constraint(equalTo: whiskyImage.bottomAnchor, constant: 10).isActive = true
        cognacImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        cognacLabel.centerXAnchor.constraint(equalTo: cognacImage.centerXAnchor).isActive = true
        cognacLabel.centerYAnchor.constraint(equalTo: cognacImage.centerYAnchor).isActive = true
        
        
        //Popular Drinks
        let popularLabel = UILabel()
        popularLabel.text = "Popular Drinks"
        popularLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        popularLabel.font = UIFont.boldSystemFont(ofSize: 25)
        popularLabel.textColor = .black
        popularLabel.textAlignment = .center
        scrollView.addSubview(popularLabel)
        
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.topAnchor.constraint(equalTo: rumImage.bottomAnchor, constant: 10).isActive = true
        popularLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        //Manhattan
        let manhattanImage = UIImageView()
        manhattanImage.layer.cornerRadius = 20
        manhattanImage.image = UIImage(named: "red-manhattan")
        manhattanImage.layer.masksToBounds = true
        manhattanImage.layoutIfNeeded()
        manhattanImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(manhattanImage)
        
        manhattanImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        manhattanImage.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        manhattanImage.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 5).isActive = true
        manhattanImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        
        let manhattanLabel = UILabel()
        manhattanLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        manhattanLabel.font = UIFont.boldSystemFont(ofSize: 13)
        manhattanLabel.textColor = .red
        manhattanLabel.textAlignment = .center
        manhattanLabel.translatesAutoresizingMaskIntoConstraints = false
        manhattanLabel.text = "Red Manhattan"
        scrollView.addSubview(manhattanLabel)
        
        manhattanLabel.topAnchor.constraint(equalTo: manhattanImage.bottomAnchor).isActive = true
        manhattanLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        manhattanLabel.centerXAnchor.constraint(equalTo: manhattanImage.centerXAnchor).isActive = true
        
        //Martini
        let chocolateChiliMartini = UIImageView()
        chocolateChiliMartini.layer.cornerRadius = 20
        chocolateChiliMartini.image = UIImage(named: "absolut-chocolate-chili-martini")
        chocolateChiliMartini.layer.masksToBounds = true
        chocolateChiliMartini.layoutIfNeeded()
        chocolateChiliMartini.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(chocolateChiliMartini)
        
        chocolateChiliMartini.heightAnchor.constraint(equalToConstant: 150).isActive = true
        chocolateChiliMartini.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        chocolateChiliMartini.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 5).isActive = true
        chocolateChiliMartini.leadingAnchor.constraint(equalTo: manhattanImage.trailingAnchor).isActive = true
        
        let martiniLabel = UILabel()
        martiniLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        martiniLabel.font = UIFont.boldSystemFont(ofSize: 13)
        martiniLabel.textColor = .red
        martiniLabel.textAlignment = .center
        martiniLabel.translatesAutoresizingMaskIntoConstraints = false
        martiniLabel.text = "Chocolate Chili Martini"
        scrollView.addSubview(martiniLabel)
        
        martiniLabel.topAnchor.constraint(equalTo: chocolateChiliMartini.bottomAnchor).isActive = true
        martiniLabel.leadingAnchor.constraint(equalTo: manhattanLabel.trailingAnchor, constant: 10).isActive = true
        martiniLabel.centerXAnchor.constraint(equalTo: chocolateChiliMartini.centerXAnchor).isActive = true
        
        //absolut-black-bloody-mary
        let blackBLoodyMary = UIImageView()
        blackBLoodyMary.layer.cornerRadius = 20
        blackBLoodyMary.image = UIImage(named: "absolut-black-bloody-mary")
        blackBLoodyMary.layer.masksToBounds = true
        blackBLoodyMary.layoutIfNeeded()
        blackBLoodyMary.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blackBLoodyMary)
        
        blackBLoodyMary.heightAnchor.constraint(equalToConstant: 150).isActive = true
        blackBLoodyMary.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        blackBLoodyMary.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 5).isActive = true
        blackBLoodyMary.leadingAnchor.constraint(equalTo: chocolateChiliMartini.trailingAnchor).isActive = true
        
        let blackBLoodyMaryLabel = UILabel()
        blackBLoodyMaryLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        blackBLoodyMaryLabel.font = UIFont.boldSystemFont(ofSize: 13)
        blackBLoodyMaryLabel.textColor = .red
        blackBLoodyMaryLabel.textAlignment = .center
        blackBLoodyMaryLabel.translatesAutoresizingMaskIntoConstraints = false
        blackBLoodyMaryLabel.text = "Black Bloody Mary"
        scrollView.addSubview(blackBLoodyMaryLabel)
        
        blackBLoodyMaryLabel.topAnchor.constraint(equalTo: blackBLoodyMary.bottomAnchor).isActive = true
        blackBLoodyMaryLabel.leadingAnchor.constraint(equalTo: martiniLabel.trailingAnchor, constant: 10).isActive = true
        blackBLoodyMaryLabel.centerXAnchor.constraint(equalTo: blackBLoodyMary.centerXAnchor).isActive = true
        
        //blueberry-daiquiri
        let blueberryDaiquiri = UIImageView()
        blueberryDaiquiri.layer.cornerRadius = 20
        blueberryDaiquiri.image = UIImage(named: "blueberry-daiquiri")
        blueberryDaiquiri.layer.masksToBounds = true
        blueberryDaiquiri.layoutIfNeeded()
        blueberryDaiquiri.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blueberryDaiquiri)

        blueberryDaiquiri.heightAnchor.constraint(equalToConstant: 150).isActive = true
        blueberryDaiquiri.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        blueberryDaiquiri.topAnchor.constraint(equalTo: manhattanLabel.bottomAnchor, constant: 5).isActive = true
        blueberryDaiquiri.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        
        let blueberryDaiquiriLabel = UILabel()
        blueberryDaiquiriLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        blueberryDaiquiriLabel.font = UIFont.boldSystemFont(ofSize: 13)
        blueberryDaiquiriLabel.textColor = .red
        blueberryDaiquiriLabel.textAlignment = .center
        blueberryDaiquiriLabel.translatesAutoresizingMaskIntoConstraints = false
        blueberryDaiquiriLabel.text = "Blueberry Daiquiri"
        scrollView.addSubview(blueberryDaiquiriLabel)
        
        blueberryDaiquiriLabel.topAnchor.constraint(equalTo: blueberryDaiquiri.bottomAnchor).isActive = true
        blueberryDaiquiriLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        blueberryDaiquiriLabel.centerXAnchor.constraint(equalTo: blueberryDaiquiri.centerXAnchor).isActive = true
        
        
        //mai-tai-special
        let maiTaiSpecial = UIImageView()
        maiTaiSpecial.layer.cornerRadius = 20
        maiTaiSpecial.image = UIImage(named: "mai-tai-special")
        maiTaiSpecial.layer.masksToBounds = true
        maiTaiSpecial.layoutIfNeeded()
        maiTaiSpecial.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(maiTaiSpecial)
        
        maiTaiSpecial.heightAnchor.constraint(equalToConstant: 150).isActive = true
        maiTaiSpecial.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        maiTaiSpecial.topAnchor.constraint(equalTo: martiniLabel.bottomAnchor, constant: 5).isActive = true
        maiTaiSpecial.leadingAnchor.constraint(equalTo: blueberryDaiquiri.trailingAnchor).isActive = true
        
        let maiTaiSpecialLabel = UILabel()
        maiTaiSpecialLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        maiTaiSpecialLabel.font = UIFont.boldSystemFont(ofSize: 13)
        maiTaiSpecialLabel.textColor = .red
        maiTaiSpecialLabel.textAlignment = .center
        maiTaiSpecialLabel.translatesAutoresizingMaskIntoConstraints = false
        maiTaiSpecialLabel.text = "Mai Tai Special"
        scrollView.addSubview(maiTaiSpecialLabel)
        
        maiTaiSpecialLabel.topAnchor.constraint(equalTo: maiTaiSpecial.bottomAnchor).isActive = true
        maiTaiSpecialLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        maiTaiSpecialLabel.centerXAnchor.constraint(equalTo: maiTaiSpecial.centerXAnchor).isActive = true
        
        
        //absolut-apeach-cosmopolitan
        let peachCosmo = UIImageView()
        peachCosmo.layer.cornerRadius = 20
        peachCosmo.image = UIImage(named: "absolut-apeach-cosmopolitan")
        peachCosmo.layer.masksToBounds = true
        peachCosmo.layoutIfNeeded()
        peachCosmo.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(peachCosmo)
        
        peachCosmo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        peachCosmo.widthAnchor.constraint(equalToConstant: (view.frame.width/3 - 10)).isActive = true
        peachCosmo.topAnchor.constraint(equalTo: blackBLoodyMaryLabel.bottomAnchor, constant: 5).isActive = true
        peachCosmo.leadingAnchor.constraint(equalTo: maiTaiSpecial.trailingAnchor).isActive = true
        
        let peachCosmoLabel = UILabel()
        peachCosmoLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        peachCosmoLabel.font = UIFont.boldSystemFont(ofSize: 13)
        peachCosmoLabel.textColor = .red
        peachCosmoLabel.textAlignment = .center
        peachCosmoLabel.translatesAutoresizingMaskIntoConstraints = false
        peachCosmoLabel.text = "Peach Cosmopolitan"
        scrollView.addSubview(peachCosmoLabel)
        
        peachCosmoLabel.topAnchor.constraint(equalTo: peachCosmo.bottomAnchor).isActive = true
        peachCosmoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        peachCosmoLabel.centerXAnchor.constraint(equalTo: peachCosmo.centerXAnchor).isActive = true
    }
    
}

/**override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
