//
//  FiltersCoctailNetworkService.swift
//  Inmost
//
//  Created by aaaus on 10.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import Foundation


class FiltersCoctailNetworkService {
    
    private init() {}
    
    static func getCocktailsFilter(completion: @escaping(GetCocktailFiltersResponse) -> ()) {
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list") else {return}
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let responseFilters = try GetCocktailFiltersResponse(json: json)
                completion(responseFilters)
            } catch {
                print(error)
            }
        }
        
    }
}
