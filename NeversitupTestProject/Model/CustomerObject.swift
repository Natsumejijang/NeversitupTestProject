//
//  Customer.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import Foundation
import Gloss
import RealmSwift

class CustomerObject: Object, Decodable {
    @objc dynamic var id: String? = nil
    @objc dynamic var customerGrade: String? = nil
    @objc dynamic var isCustomerPremium: Bool = false
    @objc dynamic var name: String? = nil
    @objc dynamic var sex:  String? = nil
    
    override static func primaryKey() -> String? {
           return "id"
    }
}
