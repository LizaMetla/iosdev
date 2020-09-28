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
   
    //let persistentContainer = NSPersistentContainer(name: "Company")
    
    
    @IBOutlet weak var NameOfCompane: UILabel!
    @IBOutlet weak var nameOfCompanyTextField: UITextField!
    
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var employeeNumberTextField: UITextField!
    
    @IBOutlet weak var EmployeeName: UILabel!
    @IBOutlet weak var employeeNameTextField: UITextField!
    
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var positionTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {

        addNewCompany(nameOfCompany: nameOfCompanyTextField.text, adress: adressTextField.text, numberOfEmployees: employeeNumberTextField.text)
        
   

        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            refreshCompanies()
        }
    }

//    private func refreshCompanies() {
//        
//        let mainContext = PersistenceManager.shared.context
//        
//        do {
//            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
//            let allCompanies = try mainContext.fetch(fetchRequest)
//            
//            //companies = allCompanies
//
//
//        } catch {
//            print(error)
//        }
//        
//    }

    
private func addNewCompany(nameOfCompany: String?, adress: String?, numberOfEmployees: String? ) {
        
        let mainContext = PersistenceManager.shared.context
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.parent = mainContext
        
        privateContext.performAndWait {
            let company = Company(context: privateContext)
            company.nameOfCompany = nameOfCompany
            company.adress = adress
            company.numberOfEmployees = 3
            
            PersistenceManager.shared.saveContext(context: privateContext)
        }
        PersistenceManager.shared.saveContext(context: mainContext)
        
        
        //refreshCompanies()
    //перекинуть на контроллер со списком
        
    }
    
    private func getAllCompanies() {
        do {
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            
            let allCompanies = try PersistenceManager.shared.context.fetch(fetchRequest)
            allCompanies.forEach { print($0.nameOfCompany ?? "No Name") }
        } catch {
            print(error)
        }
    }
    
    

