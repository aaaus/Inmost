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
    
    var cocktailsFilters = [CocktailFiltersData]()
    var cocktails = [CocktailData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Drinks";
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        CocktailData.cocktailHeaderCategoryText = "Cocktail"
        
        FiltersCoctailNetworkService.getCocktailsFilter { (responseFilters) in
            self.cocktailsFilters = responseFilters.cocktailsFilters
        }
        
        CocktailNetworkService.getCocktails { (response) in
            self.cocktails = response.cocktails
            self.tableView.reloadData()
            
        }
    }
}

extension CocktailViewController: UITableViewDelegate { }

extension CocktailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return CocktailData.cocktailCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CocktailCell
        
        let sectionNamber = indexPath.section
        CocktailData.cocktailHeaderCategoryText =  CocktailData.cocktailCategory[sectionNamber]
        CocktailNetworkService.getCocktails { (response) in
            self.cocktails = response.cocktails
            
            if indexPath[1] < self.cocktails.count {
                let cocktail = self.cocktails[indexPath.row]
                cell.configure(with: cocktail)
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        
        FiltersCoctailNetworkService.getCocktailsFilter { (responseFilters) in
            self.cocktailsFilters = responseFilters.cocktailsFilters
            label.text = CocktailData.cocktailCategory[section]
        }
        headerView.addSubview(label)
        
        return headerView
    }
    
    
    
}




