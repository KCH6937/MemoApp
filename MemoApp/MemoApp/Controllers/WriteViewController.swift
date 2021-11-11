//
//  WriteViewController.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/12.
//

import UIKit

class WriteViewController: UIViewController {

    static let identifier = "WriteViewController"
    
    var titleName: String = ""
    var content: String = ""
    
    @IBOutlet var writeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func config() {
        writeTextField.backgroundColor = .black
        writeTextField.textColor = .white
    }
    


}
