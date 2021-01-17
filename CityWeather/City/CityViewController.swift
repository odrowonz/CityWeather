//
//  ViewController.swift
//  CityWeather
//
//  Created by Andrey Antipov on 17.01.2021.
//

import UIKit
import SnapKit

class CityViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    var filteredCities: [City] = []
    
    // SearchBar fir filter
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Find city..."
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(red: 236.0/255.0, green: 236.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        return searchController
    }()
    
    // TableView for cities list
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableHeaderView = searchController.searchBar
        tv.register(CityTableViewCell.self,
                           forCellReuseIdentifier: String(describing: CityTableViewCell.self))
        tv.dataSource = self
        tv.delegate = self
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        setupLayout()
        

    }
    
    // MARK: Autolayout
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    // MARK: Search Controller
    func filterContent(for searchText: String) {
        filteredCities = AllCities.list.filter({ (city) -> Bool in
            return city.name.localizedCaseInsensitiveContains(searchText)
        })
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cnt = searchController.isActive ? filteredCities.count : AllCities.list.count
        return cnt < 10 ? cnt : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityTableViewCell.self), for: indexPath) as? CityTableViewCell
        else { return UITableViewCell() }

        cell.city = (searchController.isActive) ? filteredCities[indexPath.row] : AllCities.list[indexPath.row]

        return cell

    }
}

