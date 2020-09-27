//
//  Company+CoreDataProperties.swift
//  hw18
//
//  Created by Елизавета Метла on 9/25/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    //проперти
    @NSManaged public var nameOfCompany: String?
    @NSManaged public var adress: String?
    @NSManaged public var numberOfEmployees: String?
    //@NSManaged public var employees: NSSet? //коллекция

}

// MARK: Generated accessors for employees
//массив
//extension Company {
//
//    @objc(addEmployeesObject:)
//    @NSManaged public func addToEmployees(_ value: Employee)
//
//    @objc(removeEmployeesObject:)
//    @NSManaged public func removeFromEmployees(_ value: Employee)
//
//    @objc(addEmployees:)
//    @NSManaged public func addToEmployees(_ values: NSSet)
//
//    @objc(removeEmployees:)
//    @NSManaged public func removeFromEmployees(_ values: NSSet)
//
//}
