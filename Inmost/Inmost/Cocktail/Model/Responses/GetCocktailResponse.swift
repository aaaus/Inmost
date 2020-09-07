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
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
    
        var cocktails = [CocktailData]()
        for dictionary in array {
            guard let cocktail = CocktailData(dict: dictionary) else { continue }
            cocktails.append(cocktail)
        }
        self.cocktails = cocktails
    }
}
