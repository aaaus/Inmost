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
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {return}
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCocktailResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }

    }
}
