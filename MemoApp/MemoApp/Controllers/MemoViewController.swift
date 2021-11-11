//
//  ViewController.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/10.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memoList: [Memo] = []
    
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
        
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "검색"
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
        
        config()
        registerNib()

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
    
    func registerNib() {
        let nibName = UINib(nibName: MemoTableViewCell.identifier, bundle: nil)
        memoTableView.register(nibName, forCellReuseIdentifier: MemoTableViewCell.identifier)
    }


}

extension MemoViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
    
}


extension MemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "메모"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = memoTableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        // 처음과 마지막 셀 인덱스에 radius 주기
        cell.config()
            
        cell.titleLabel.text = "ㅔ메모.."
        cell.contentLabel.text = "메모오옹"
        cell.dateLabel.text = "123"
        
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let writeViewController = self.storyboard?.instantiateViewController(withIdentifier: WriteViewController.identifier) as? WriteViewController else { return }
        
        writeViewController.titleName = memoList[indexPath.row].title
        writeViewController.content = memoList[indexPath.row].content
        
        self.navigationController?.pushViewController(writeViewController, animated: true)
    }
}

