//
//  CocktailData.swift
//  Inmost
//
//  Created by aaaus on 07.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation


struct CocktailData {
    var strDrink: String
    var strDrinkThumb: String
    static var cocktailHeaderCategoryText = String()
    static var cocktailCategory = [String()]
    
    init?(dict: [String: AnyObject]) {
        
        guard let strDrink = dict["strDrink"] as? String,
            let strDrinkThumb = dict["strDrinkThumb"] as? String else {return nil}
        
        self.strDrinkThumb = strDrinkThumb
        self.strDrink = strDrink
    }
}
