//
//  LiquerCollectionViewCell.swift
//  Besotted
//
//  Created by Jonathan Grajkowski on 2019-12-07.
//  Copyright © 2019 Jonathan Grajkowski. All rights reserved.
//

import UIKit

class LiquerCollectionViewCell: UICollectionViewCell {
         
    var bg: UIImageView = {
        let iv = UIImageView()
        iv.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    var titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:100, y: 30, width: UIScreen.main.bounds.width , height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.red
        label.adjustsFontSizeToFitWidth = true
        return label
        
    }()
 
    override init(frame: CGRect) {
        let bg = UIImageView()
        bg.contentMode = .scaleAspectFill
        bg.clipsToBounds = true
        bg.layer.cornerRadius = 12

        super.init(frame: frame)
        //self.addSubview(self.titleLabel)
        self.addSubview(self.bg)
        self.bg.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.bg.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.bg.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
        self.bg.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -20).isActive = true

        self.addSubview(self.titleLabel)
        self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
       // self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.titleLabel.widthAnchor.constraint(equalToConstant: self.bg.frame.width).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
