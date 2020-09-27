//
//  TableViewController.swift
//  hw18
//
//  Created by Елизавета Метла on 9/26/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var companies: [String] = []

    @IBAction func AddCompanyAction(_ sender: UIBarButtonItem) {
    }
    
    
//    func saveCompany() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let content = appDelegate.pers
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return companies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //все компании имеют id + ячейки
        cell.textLabel?.text = companies[indexPath.row]

        return cell
    }
    
    
    


}
