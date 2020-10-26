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

<<<<<<< HEAD
    @NSManaged public var nameOfCompany: String?
    @NSManaged public var adress: String?
    @NSManaged public var numberOfEmployees: String?

}
=======
    
    @NSManaged public var nameOfCompany: String?
    @NSManaged public var adress: String?
    @NSManaged public var numberOfEmployees: Int64
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
//массив
extension Company {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Employee)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Employee)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)

}
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
