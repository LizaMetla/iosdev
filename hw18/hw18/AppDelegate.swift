//
//  AppDelegate.swift
//  hw18
//
//  Created by Елизавета Метла on 9/25/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import CoreData
import Combine

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
<<<<<<< HEAD
    
    
    

    
//    var window: UIWindow?
//    //var context: NSManagedObjectContext!
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
////        context = persistentContainer.viewContext
////        createCompany()
//
////        // Описание сущности
//       //let entityDescription = NSEntityDescription.entityForName("Company", inManagedObjectContext: self.managedObjectContext)
////
////        // Создание нового объекта
////        let managedObject = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
//
//        return true
//    }
//
//
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        self.saveContext()
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: "hw18")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//}
//
////extension AppDelegate {
////    private func createCompany() {
////        let company1 = Company(context: context)
////        company1.nameOfCompany = "Exete"
////        company1.adress = "Широкая 25"
////        company1.numberOfEmployees = 3
////        company1.
////    }
////}
//
=======
>>>>>>> 67f3968152238fb7aa70ced5354f4daa1be140fb
