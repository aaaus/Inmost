//
//  ViewController.swift
//  Inmost
//
//  Created by aaaus on 07.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cocktails = [CocktailData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CocktailNetworkService.getCocktails { (response) in
            self.cocktails = response.cocktails
            self.tableView.reloadData()
        }
        
    }
    
}

extension CocktailViewController: UITableViewDelegate { }

extension CocktailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailCell
        let cocktail = cocktails[indexPath.row]
        cell.configure(with: cocktail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    
    
}





