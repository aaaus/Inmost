//
//  GetCocktailResponse.swift
//  Inmost
//
//  Created by aaaus on 07.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation


struct GetCocktailResponse {
    
    let cocktails: [CocktailData]
    
    var dictionaryArray: [String: Any] =  ["abc": "123"]
    
    init(json: Any) throws {
        
        if let dictionary = json as? [String: AnyObject] {
            dictionaryArray = dictionary
        }
        
        guard let array = dictionaryArray["drinks"] as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
        
        var cocktails = [CocktailData]()
        
        for dictionary in array {
            guard let cocktail = CocktailData(dict: dictionary) else { continue }
            cocktails.append(cocktail)
        }
        self.cocktails = cocktails
        
        
        
    }
}

