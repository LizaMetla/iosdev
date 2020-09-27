//
//  Company+CoreDataClass.swift
//  hw18
//
//  Created by Елизавета Метла on 9/25/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(Company)
public class Company: NSManagedObject {
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Company")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
