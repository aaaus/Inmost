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
    
    
    func configure(with cocktailData: CocktailData) {
        self.cellTextLabel.text = cocktailData.strDrink
        guard let url = URL(string: cocktailData.strDrinkThumb) else {return}
        load(url: url)
    }
    
}

extension CocktailCell {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.cellImageView.image = image
                    }
                }
            }
        }
    }
}


