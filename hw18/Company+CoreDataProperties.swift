//
//  Company+CoreDataProperties.swift
//  hw18
//
//  Created by Елизавета Метла on 9/28/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var nameOfCompany: String?
    @NSManaged public var adress: String?
    @NSManaged public var numberOfEmployees: String?

}
