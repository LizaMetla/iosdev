//
//  ShowCompanyViewController.swift
//  hw18
//
//  Created by Елизавета Метла on 9/26/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ShowCompanyViewController: UIViewController {

    @IBOutlet weak var companyTextLabel: UITextField!
    @IBOutlet weak var adressTextLabel: UITextField!
    @IBOutlet weak var numberOfEmployesTextField: UITextField!
    
    var companyName :String?
    var companyAdress: String?
    var numberEmployees: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
     companyTextLabel.text = companyName
     adressTextLabel.text = companyAdress
     numberOfEmployesTextField.text = numberEmployees
    }
}
