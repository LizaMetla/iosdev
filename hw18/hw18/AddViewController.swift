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
    var company: Company?
    //var company: [String] = []
    
    let persistentContainer = NSPersistentContainer(name: "Company")
    
    
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

        let context: NSManagedObjectContext = {
          return persistentContainer.viewContext
        }()
        company = Company(context: context)
        company?.nameOfCompany = nameOfCompanyTextField.text
        company?.adress = adressTextField.text
        company?.numberOfEmployees = employeeNumberTextField.text
        //company?.p positionTextField.text
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
