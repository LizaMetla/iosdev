//
//  AddViewController.swift
//  hw18
//
//  Created by Елизавета Метла on 9/25/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    private var companies: [Company] = []
    
    
    @IBOutlet weak var NameOfCompane: UILabel!
    @IBOutlet weak var nameOfCompanyTextField: UITextField!
    
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var employeeNumberTextField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {

        addNewCompany(nameOfCompany: nameOfCompanyTextField.text, adress: adressTextField.text, numberOfEmployees: employeeNumberTextField.text)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
        }
    }

    private func addNewCompany(nameOfCompany: String?, adress: String?, numberOfEmployees: String? ) {
        
        let mainContext = PersistenceManager.shared.context
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.parent = mainContext
        
        privateContext.performAndWait {
            let company = Company(context: privateContext)
            company.nameOfCompany = nameOfCompany
            company.adress = adress
            company.numberOfEmployees = Int64(numberOfEmployees ?? "0")!
            
            PersistenceManager.shared.saveContext(context: privateContext)
        }
        PersistenceManager.shared.saveContext(context: mainContext)
        

    }

    
    

