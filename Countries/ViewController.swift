//
//  ViewController.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var searchResultstblView: UITableView!
  let viewModel = SearchViewModel()
  let searchController = UISearchController(searchResultsController: nil)

  override func viewDidLoad() {
    super.viewDidLoad()
    setSearchControllerAppearance()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

//  var isSearchBarEmpty: Bool {
//    return searchController.searchBar.text?.isEmpty ?? true
//  }

}

//MARK: UI Components
extension ViewController {
    func setSearchControllerAppearance() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["Search Country"]
    }
}
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    return cell
  }
}

extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    viewModel.getSearchResult(searchBar.text)
  }
}

