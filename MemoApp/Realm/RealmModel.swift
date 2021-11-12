//
//  RealmTable.swift
//  MemoApp
//
//  Created by 강채현 on 2021/11/12.
//

import Foundation
import RealmSwift

// 테이블
// @Persisted : 컬럼
class MemoList: Object {
    
    @Persisted var title: String = "제목 없음"
    @Persisted var content: String = ""
    @Persisted var date = Date()
    @Persisted var isPin: Bool = false
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(title: String, content: String, date: Date, isPin: Bool) {
        self.init()
        
        self.title = title
        self.content = content
        self.date = date
        self.isPin = isPin
        }
}
