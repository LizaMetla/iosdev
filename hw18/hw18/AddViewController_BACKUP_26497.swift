//
//  AddViewController.swift
//  hw18
//
//  Created by Елизавета Метла on 9/25/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import CoreData

<<<<<<< HEAD
class AddViewController: UIViewController {
    
    private var companies: [Company] = []
   
    //let persistentContainer = NSPersistentContainer(name: "Company")
=======
class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    private var companies: [Company] = []
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
    
    let number = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    var pickerView = UIPickerView()
    @IBOutlet weak var NameOfCompane: UILabel!
    @IBOutlet weak var nameOfCompanyTextField: UITextField!
    
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var employeeNumberTextField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {

        addNewCompany(nameOfCompany: nameOfCompanyTextField.text, adress: adressTextField.text, numberOfEmployees: employeeNumberTextField.text)
<<<<<<< HEAD
        
   

=======
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
<<<<<<< HEAD
            refreshCompanies()
        }
    }

    private func refreshCompanies() {
        
        let mainContext = PersistenceManager.shared.context
        
        do {
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            let allCompanies = try mainContext.fetch(fetchRequest)
            
            //companies = allCompanies


        } catch {
            print(error)
        }
        
    }

    
private func addNewCompany(nameOfCompany: String?, adress: String?, numberOfEmployees: String? ) {
=======
            
            pickerView.delegate = self
            pickerView.dataSource = self
            
            employeeNumberTextField.inputView = pickerView
            employeeNumberTextField.textAlignment = .center
            employeeNumberTextField.placeholder = "Кол-во работников"
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return number.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return number[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        employeeNumberTextField.text = number[row]
        employeeNumberTextField.resignFirstResponder()
    }
    
}

    
    private func addNewCompany(nameOfCompany: String?, adress: String?, numberOfEmployees: String? ) {
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
        
        let mainContext = PersistenceManager.shared.context
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.parent = mainContext
        
        privateContext.performAndWait {
            let company = Company(context: privateContext)
            company.nameOfCompany = nameOfCompany
            company.adress = adress
<<<<<<< HEAD
            company.numberOfEmployees = numberOfEmployees
=======
            //need to change
            company.numberOfEmployees = Int64(numberOfEmployees ?? "0")!
            
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
            
            PersistenceManager.shared.saveContext(context: privateContext)
        }
        PersistenceManager.shared.saveContext(context: mainContext)
<<<<<<< HEAD
        
        
        refreshCompanies()
        
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
    
    

=======
    }
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
