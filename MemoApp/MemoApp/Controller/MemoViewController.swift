//
//  ViewController.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/10.
//

import UIKit

class MemoViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var footerView: UIView!
    
    @IBOutlet var memoCountLabel: UILabel!
    @IBOutlet var writeButton: UIButton!
    
    @IBOutlet var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "검색"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        config()

    }
    
    func config() {
        
        headerView.backgroundColor = .appColor(.headerColor)
        
        writeButton.tintColor = .appColor(.buttonColor)
        writeButton.setTitle("", for: .normal)
        
        footerView.backgroundColor = .appColor(.backgroundColor)
        
        memoCountLabel.textColor = .appColor(.textColor)
        memoCountLabel.text = "0개의 메모"
        
        memoTableView.backgroundColor = .appColor(.backgroundColor)
        
    }


}

extension MemoViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
    
}


extension MemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
    
}

