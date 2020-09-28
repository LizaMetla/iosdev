//
//  TableViewController.swift
//  hw18
//
//  Created by Елизавета Метла on 9/26/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    private var companies: [Company] = []

    @IBAction func AddCompanyAction(_ sender: UIBarButtonItem) {
    }

    private lazy var fetchedResultsController: NSFetchedResultsController<Company> = {
        
        let mainContext = PersistenceManager.shared.context
        
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        let nameSD = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSD]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: mainContext,
                                             sectionNameKeyPath: "name",
                                             cacheName: nil)
        //frc.delegate = self
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshCompanies()
    }
    
    private func refreshCompanies() {
        
        let mainContext = PersistenceManager.shared.context
        
        do {
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            let allCompanies = try mainContext.fetch(fetchRequest)
            
            companies = allCompanies
            tableView.reloadData()

        } catch {
            print(error)
        }
        
    }
    private func printDBPath() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return companies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //все компании имеют id + ячейки
        cell.textLabel?.text = companies[indexPath.row].nameOfCompany ?? "NO NAME"

        return cell
    }

}
//extension TableViewController: NSFetchedResultsControllerDelegate {
//
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
//        sectionName
//    }
//
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.beginUpdates()
//    }
//
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
//        switch type {
//        case .insert:
//            tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
//        case .delete:
//            tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
//        default:
//            return
//        }
//    }
//
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//        case .insert:
//            if let indexPath = newIndexPath as IndexPath? {
//                tableView.insertRows(at: [indexPath], with: .automatic)
//            }
//        case .update:
//            if let indexPath = indexPath as IndexPath? {
//                let company = fetchedResultsController.object(at: indexPath)
//                guard let cell = tableView.cellForRow(at: indexPath) as? "Cell" else { break }
//                cell.update(with: company)
//            }
//        case .move:
//            if let indexPath = indexPath as IndexPath? {
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//            if let newIndexPath = newIndexPath as IndexPath? {
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//        case .delete:
//            if let indexPath = indexPath as IndexPath? {
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//        @unknown default: break
//        }
//    }
//
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.endUpdates()
//    }
//}

//extension TableViewController {
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        switch editingStyle {
//        case .delete:
//            let company = companies[indexPath.row]
//
//            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete company with name \(company.name ?? "")?", preferredStyle: .alert)
//
//            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
//
//                guard let self = self else { return }
//
//                let mainContext = PersistenceManager.shared.context
//                mainContext.delete(company)
//                PersistenceManager.shared.saveContext(context: mainContext)
//
//                self.refreshCompanies()
//            }
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//
//            alert.addAction(cancelAction)
//            alert.addAction(deleteAction)
//
//            present(alert, animated: true, completion: nil)
//
//        default: break
//        }
//
//    }
//}

