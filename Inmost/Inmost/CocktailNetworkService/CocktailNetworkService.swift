//
//  CocktailNetworkService.swift
//  Inmost
//
//  Created by aaaus on 07.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation

class CocktailNetworkService {
    
    private init() {}
    
    static func getCocktails(completion: @escaping(GetCocktailResponse) -> ()) {
        
        let cleanString = CocktailData.cocktailHeaderCategoryText.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=" + cleanString) else {return}
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCocktailResponse(json: json)
                // print(response)
                completion(response)
            } catch {
                print(error)
            }
        }
        
    }
}
