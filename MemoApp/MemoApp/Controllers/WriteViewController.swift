//
//  WriteViewController.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/12.
//

import UIKit
import RealmSwift

class WriteViewController: UIViewController {

    static let identifier = "WriteViewController"
    
    let localRealm = try! Realm()
    
    var titleName: String = ""
    var content: String = ""
    var isEdited: Bool = false
    
    @IBOutlet var writeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        navConfig()
        
        print("realm is located at ", localRealm.configuration.fileURL!)
        
    }
    
    @objc func backButtonClicked() {
        saveData()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func finishButtonClicked() {
        if isEdited == true {
            
        } else {
            saveData()
        }
        
        view.endEditing(true)
    }
    
    @objc func shareButtonClicked() {
        print(#function)
    }
    
    func config() {
        
        // return 키 감지하는 코드를 모르겠습니다.. ㅠ
//        writeTextView.text = "\(titleName)\n\(content)"
        writeTextView.text = titleName
        
        self.view.backgroundColor = .black
        writeTextView.backgroundColor = .black
        writeTextView.textColor = .white
    }
    
    func navConfig(/*_ backTo: String*/) {

//        let backButton = UIBarButtonItem(title: backTo, style: .plain, target: self, action: #selector(backButtonClicked))
//        backButton.tintColor = .appColor(.buttonColor)
//        backButton.image = UIImage(systemName: <#T##String#>)
//        navigationItem.leftBarButtonItem = backButton
        
        
        let shareBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonClicked))
        shareBarButton.tintColor = .appColor(.buttonColor)
        
        let finishBarButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(finishButtonClicked))
        finishBarButton.tintColor = .appColor(.buttonColor)
        
        navigationItem.rightBarButtonItems = [finishBarButton, shareBarButton]
    }
    
    func hideKeyboard() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    func saveData() {
        // let divArr = writeTextView.text.components(separatedBy: "\n")
        let task = MemoList(title: writeTextView.text!, content: "제작중.. 분발하겠습니다", date: Date(), isPin: false)
            try! localRealm.write {
                localRealm.add(task)
            }
    }
    
}
    



