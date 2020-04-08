//
//  ViewController.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchResultstblView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  let viewModel = SearchViewModel()
  let searchController = UISearchController(searchResultsController: nil)
    var searchResult: [APIResponseModel]?
    var selctedInfo: APIResponseModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailView") {

            let vc = segue.destination as? DetailsViewController
            vc?.selectedCountry = selctedInfo
        }

    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return searchResult?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell
    if let data = searchResult?[indexPath.row] {
        cell?.name.text = data.name
        if let imageURL = data.flag {
            cell?.setDataForCell(URL.init(string: imageURL)!)
        }
    }
    return cell!
  }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selctedInfo = searchResult?[indexPath.row]
         performSegue(withIdentifier: "DetailView", sender: self)

    }
}

extension ViewController: viewModelDelagte {
    func updateSearchData(response: [APIResponseModel]) {
        searchResult = response
        DispatchQueue.main.async {
            self.searchResultstblView.reloadData()
        }
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getSearchResult(searchBar.text)
    }

}

