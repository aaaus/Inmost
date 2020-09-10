//
//  CocktailFiltersData.swift
//  Inmost
//
//  Created by aaaus on 10.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation

struct CocktailFiltersData {
    
    var strCategory: String
    
    init?(dict: [String: AnyObject]) {
        
        
        guard let strCategory = dict["strCategory"] as? String else {return nil}
        
        self.strCategory = strCategory
    }
}
