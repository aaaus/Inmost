//
//  CocktailFiltersViewController.swift
//  Inmost
//
//  Created by aaaus on 10.09.2020.
//  Copyright © 2020 aaaus. All rights reserved.
//

import UIKit

class CocktailFiltersViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cocktailsFilters = [CocktailFiltersData]()
    var lastSelection: NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Vector2")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Vector2")
        navigationController?.navigationBar.tintColor = UIColor.black
        
        FiltersCoctailNetworkService.getCocktailsFilter { (responseFilters) in
            self.cocktailsFilters = responseFilters.cocktailsFilters
            self.tableView.reloadData()
        }
    }
}


extension CocktailFiltersViewController: UITableViewDelegate { }

extension CocktailFiltersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailsFilters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CoctailFilterCell
        let cocktailFilter = self.cocktailsFilters[indexPath.row]
        cell.configure(with: cocktailFilter)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        CocktailData.cocktailCategory.remove(at: indexPath[1])
    }
    
}
