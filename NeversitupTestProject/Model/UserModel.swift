//
//  UserModel.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object, Decodable {
    @objc dynamic var id: String? = nil
    @objc dynamic var status: String? = nil
    @objc dynamic var token: String? = nil
    @objc dynamic var customers: [CustomerObject]? = nil
    
    override static func primaryKey() -> String? {
           return "id"
    }
    
    static func save(_ user: UserModel) {
        let userRealm = UserModel()
        userRealm.id = user.id ?? ""
        userRealm.status = user.status ?? ""
        userRealm.token = user.token
        userRealm.customers = user.customers
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(userRealm)
        }
    }
}
