//
//  CocktailCell.swift
//  Inmost
//
//  Created by aaaus on 07.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import UIKit

class CocktailCell: UITableViewCell {
    
    
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    //@IBOutlet weak var cellTextLabel: UILabel!
    //@IBOutlet weak var cellImageView: UIImageView!
    
    func configure(with cocktailData: CocktailData) {
        self.cellTextLabel.text = cocktailData.name
        self.cellImageView.image = UIImage(named: cocktailData.email)
    }
    
}
