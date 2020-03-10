//
//  DashboradViewController.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import UIKit
import RealmSwift


class DashboradViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var mockupUser = ["test test","5","5","5","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self //Set the delegate
        tableView.dataSource = self //Set the datasource
        
        addFooter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }
    
    func addFooter() {
        let exitView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        exitView.backgroundColor = UIColor.lightGray
        let button = UIButton(frame: CGRect(x: 150, y: 0, width: 100, height: 50))
        button.setTitle("Exit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        exitView.addSubview(button)
        tableView.tableFooterView = exitView
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        self.alertMessage("Exit Successful")
    }

}

extension DashboradViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // open this line for use mockup data
//        return self.mockupUser.count
        
        let user = RealmManager.sharedInstance.getDataFromDB().first
        return (user?.customers!.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as UITableViewCell?)!
        
        // comment two line below for use mockup data
        let user = RealmManager.sharedInstance.getDataFromDB().first
        cell.textLabel?.text = user?.customers![indexPath.row].name
        
        cell.textLabel?.text = self.mockupUser[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // comment two line below for use mockup data
        let item = RealmManager.sharedInstance.getDataFromDB().first!
        vc.user = item
        
        self.present(vc, animated: true, completion: nil)
    }
}
