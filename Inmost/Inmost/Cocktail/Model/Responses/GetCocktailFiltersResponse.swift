//
//  GetCocktailFiltersResponse.swift
//  Inmost
//
//  Created by aaaus on 10.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation

struct GetCocktailFiltersResponse {
    let cocktailsFilters: [CocktailFiltersData]
    
    var dictionaryArray: [String: Any] =  ["abc": "123"]
    
    
    init(json: Any) throws {
        
        if let dictionary = json as? [String: AnyObject] {
            dictionaryArray = dictionary
        }
        
        guard let array = dictionaryArray["drinks"] as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
        
        var cocktailsFilters = [CocktailFiltersData]()
        
        CocktailData.cocktailCategory.removeAll()
        
        for dictionary in array {
            guard let cocktailFilter = CocktailFiltersData(dict: dictionary) else { continue }
            CocktailData.cocktailCategory.append(cocktailFilter.strCategory)
            cocktailsFilters.append(cocktailFilter)
        }
        self.cocktailsFilters = cocktailsFilters
        
        
    }
}
