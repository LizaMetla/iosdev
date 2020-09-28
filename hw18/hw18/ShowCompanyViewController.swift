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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 override func viewWillAppear(_ animated: Bool) {
     companyTextLabel.text = companyName
 }
    
     
}
