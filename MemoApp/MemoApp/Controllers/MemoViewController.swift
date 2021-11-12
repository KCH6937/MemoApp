//
//  ViewController.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/10.
//

import UIKit
import RealmSwift
import Network

class MemoViewController: UIViewController {
    
    let localRealm = try! Realm()
    
    var tasks: Results<MemoList>!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let writeStoryBoard = UIStoryboard.init(name: "Write", bundle: nil)
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var footerView: UIView!
    
    @IBOutlet var memoCountLabel: UILabel!
    
    @IBOutlet var writeButton: UIButton!
    @IBOutlet var backButton: UIBarButtonItem!
    
    @IBOutlet var memoTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        tasks = localRealm.objects(MemoList.self)
        
        // 서치 컨트롤러 공부하기..
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "검색"
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
        
        config()
        registerNib()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewDidLoad()
            
            memoTableView.reloadData()
        }
    
    @IBAction func writeButtonClicked(_ sender: UIButton) {
        print(tasks.count)
        guard let writeViewController = writeStoryBoard.instantiateViewController(withIdentifier: WriteViewController.identifier) as? WriteViewController else { return }
        
        self.navigationController?.pushViewController(writeViewController, animated: true)
    }
    
    func config() {
        
        headerView.backgroundColor = .appColor(.headerColor)
        
        writeButton.tintColor = .appColor(.buttonColor)
        writeButton.setTitle("", for: .normal)
        
        footerView.backgroundColor = .appColor(.backgroundColor)
        
        memoCountLabel.textColor = .appColor(.textColor)
        memoCountLabel.text = "0개의 메모"
        
        memoTableView.backgroundColor = .appColor(.backgroundColor)
        
        let margin: CGFloat = 15
        
        memoTableView.layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        backButton.tintColor = .appColor(.buttonColor)
        
        searchBar.barTintColor = .appColor(.headerColor)
        searchBar.placeholder = "검색"
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
        // 섹션 타이틀 색 바꾸는법 알아보기
        return "메모"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memoCountLabel.text = "\(tasks.count) 개의 메모"
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = memoTableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.config()
        
        let row = tasks[indexPath.row]
        
        if indexPath.row == 0 || indexPath.row == tasks.count {
            cell.layer.cornerRadius = 8
        }
        
        cell.titleLabel.text = row.title
        cell.contentLabel.text = row.content
        
        let writeDay: String = "\(row.date)".replacingOccurrences(of: "-", with: ".")
        cell.dateLabel.text = writeDay.components(separatedBy: " ")[0]
        
        return cell
                
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let writeViewController = writeStoryBoard.instantiateViewController(withIdentifier: WriteViewController.identifier) as? WriteViewController else { return }
        
        writeViewController.titleName = tasks[indexPath.row].title
        writeViewController.content = tasks[indexPath.row].content
        
        self.navigationController?.pushViewController(writeViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        try! localRealm.write {
            localRealm.delete( tasks[indexPath.row] )
            tableView.reloadData()
        }
    }
}

