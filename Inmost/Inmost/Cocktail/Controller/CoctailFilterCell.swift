//
//  CoctailFilterCell.swift
//  Inmost
//
//  Created by aaaus on 10.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import UIKit

class CoctailFilterCell: UITableViewCell {
    
    
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    func configure(with CocktailFiltersData: CocktailFiltersData) {
        self.cellTextLabel.text = CocktailFiltersData.strCategory
    }
    
}

