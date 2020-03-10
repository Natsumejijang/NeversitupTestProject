//
//  DetailViewController.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    var user: UserModel?
    var currentCustomer: CustomerObject?
    
    var mockupCustomer = CustomerObject()
    
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var isCustomerPremiumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        mockupCustomer.id = "789456"
        mockupCustomer.customerGrade = "C"
        mockupCustomer.isCustomerPremium = false
        mockupCustomer.name = "Test Test"
        mockupCustomer.sex = "Female"
        
        vertifyToken()
    }
    
    func vertifyToken() {
        
        // uncomment this line for use mockup data
//        self.showDetail(customer: self.mockupCustomer)
        
        AF.request("/getCustomerDetail", method: .post, parameters: ["token":user?.token,"customerId":currentCustomer?.id]).response { response in
            debugPrint(response)
            if response.error != nil {
                self.alertMessage(response.error!.localizedDescription)
            } else{
                let customer = try! JSONDecoder().decode(CustomerObject.self, from: response.data!)
                self.showDetail(customer: customer)
            }
        }
    }
    
    func showDetail(customer: CustomerObject) {
        
        self.nameLabel.text = customer.name
        self.idLabel.text = customer.id
        
        if customer.isCustomerPremium {
            self.isCustomerPremiumLabel.text = "Premium"
        } else{
             self.isCustomerPremiumLabel.text = "Not Premium"
        }
        
        self.sexLabel.text = customer.sex
        self.customerGradeLabel.text = customer.customerGrade
    }
    
    func setProfileImage() {
        profileImage.makeRounded()
    }
    
    @IBAction func backDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
