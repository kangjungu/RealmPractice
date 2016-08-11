//
//  DBManager.swift
//  RealmPractice
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager{
    
    static let instance = DBManager();
    //try에러만 안나게하겠다는 뜻
    
    let realm = try! Realm()
    
    //add
    func add (person : Person){
        //이런식으로 간단하게 넣어주면됨
        try! realm.write {
            realm.add(person)
        }
    }
    
    //delete
    //이거 대신 id를 파라미터를 넣어줘서 삭제하는 것으로 하기
    func delete(person : Person){
        try! realm.write({
            realm.delete(person)
        })
    }
    
    //update
    //이거 대신 id를 파라미터를 넣어줘서 삭제하는 것으로 하기
    func update(person : Person){
        
        try! realm.write({
            realm.add(person, update: true)
        })
        
    }
    
    //리스트 가져옴
    func getList() -> Results<Person>{
        return realm.objects(Person)
    }
    
    
}