//
//  Alert+Extension.swift
//  MemoAPP
//
//  Created by 강채현 on 2021/11/10.
//

import Foundation
import UIKit

extension UIViewController {
    
    // @escaping: 탈출 클로저
    func showAlert(title: String, message: String, okTitle: String, okAction: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        let ok = UIAlertAction(title: okTitle, style: .default) { _ in
            print("확인")
            
            okAction()
            
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true) {
            print("alert")
        }
    }
}
