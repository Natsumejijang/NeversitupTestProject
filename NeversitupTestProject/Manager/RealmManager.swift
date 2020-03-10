//
//  RealmManager.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private var   database:Realm
     static let   sharedInstance = RealmManager()
    
    private init() {
       database = try! Realm()
    }
    
    func getDataFromDB() ->   Results<UserModel> {
     let results: Results<UserModel> =  database.objects(UserModel.self)
     return results
    }
}
