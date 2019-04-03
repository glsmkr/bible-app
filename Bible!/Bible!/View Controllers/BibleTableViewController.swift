//
//  BibleTableViewController.swift
//  Bible!
//
//  Created by Julian A. Fordyce on 2/25/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class BibleTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(bibleController.results.count)
        return bibleController.results.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let searchResult = bibleController.results[indexPath.row]
        cell.textLabel?.text = searchResult.reference
        cell.detailTextLabel?.text = searchResult.content
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        bibleController.search(term: searchTerm) { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                    searchBar.text = ""
                searchBar.placeholder = searchTerm
                searchBar.resignFirstResponder()
            }
        
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellDetail" {
            guard let dvc = segue.destination as? BibleDetailViewController,
                let tappedRow = tableView.indexPathForSelectedRow else { return }
            let results = bibleController.results[tappedRow.row]
            dvc.bibleController = bibleController
            dvc.result = results
        }
    }


    // MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    let bibleController = BibleController()
    
}
