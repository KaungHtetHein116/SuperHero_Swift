//
//  SuperHeroViewController.swift
//  SuperHero
//
//  Created by Kaung Htet Hein on 10/14/21.
//

import UIKit

class SuperHeroViewController:  UIViewController {
    private var superHeroList: [SuperHeros]?
    private var filteredList: [SuperHeros]?
    private let cellIdentifier: String = "myCell"
    private let segueIdentifier: String = "showSuperHeroDetail"
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superHeroList = SuperHeros.superHeroList
        
        filteredList = superHeroList
        
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueIdentifier {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell),
               let superHeroVC = segue.destination as? SuperHeroDetailViewController {
                superHeroVC.superHero = filteredList?[indexPath.row]
            }
        }
    }
}

extension SuperHeroViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? SuperHeroListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        
        let superHero = self.filteredList![indexPath.row]
        
        cell.superHeroLabel.text = superHero.name
        cell.superHeroImage.image = UIImage(named: superHero.image)
        
        return cell
    }
}

extension SuperHeroViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredList = superHeroList
        } else {
            let list = superHeroList?.filter({ (superHero) -> Bool in
                superHero.name.lowercased().contains(searchText.lowercased())
            })
            filteredList = list
        }
        
        tableView.reloadData()
    }
}
