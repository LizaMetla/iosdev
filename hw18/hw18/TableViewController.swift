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
    
    @IBAction func AddCompanyAction(_ sender: UIBarButtonItem) {
    }
    
    private var companies: [Company] = []

    private lazy var fetchedResultsController: NSFetchedResultsController<Company> = {
        
        let mainContext = PersistenceManager.shared.context
        
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        let nameSD = NSSortDescriptor(key: "nameOfCompany", ascending: true)
        fetchRequest.sortDescriptors = [nameSD]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: mainContext,
                                             sectionNameKeyPath: "nameOfCompany",
                                             cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printDBPath()
        do {
            try fetchedResultsController.performFetch()
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
        
        guard let sections = fetchedResultsController.sections else { return 0 }
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else { return 0 }
        let targetSection = sections[section]
        return targetSection.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = fetchedResultsController.sections else { return nil }
        let targetSection = sections[section]
        return targetSection.name
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CompanyTableViewCell else { fatalError() }
        
        let company = fetchedResultsController.object(at: indexPath)
        cell.update(with: company)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedCompany = fetchedResultsController.object(at: indexPath)
        let newView: ShowCompanyViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowCompany") as! ShowCompanyViewController

        newView.companyName = selectedCompany.nameOfCompany ?? ""
        newView.companyAdress = selectedCompany.adress ?? ""
        //need to change
        newView.numberEmployees = String(selectedCompany.numberOfEmployees)
        
        
        present(newView, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)



   }

}

//MARK: - delete company in a row

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            let company = fetchedResultsController.object(at: indexPath)
            
            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete company with name \(company.nameOfCompany ?? "")?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                let mainContext = PersistenceManager.shared.context
                mainContext.delete(company)
                PersistenceManager.shared.saveContext(context: mainContext)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            
            alert.addAction(cancelAction)
            alert.addAction(deleteAction)
            
            present(alert, animated: true, completion: nil)
            
        default: break
        }
    }
}

// MARK: - Showing TableView with Updated data data + NSFetchedResultsControllerDelegate

extension TableViewController: NSFetchedResultsControllerDelegate {

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        sectionName
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
        case .delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
        default:
            return
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath as IndexPath? {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath as IndexPath? {
                let company = fetchedResultsController.object(at: indexPath)
                guard let cell = tableView.cellForRow(at: indexPath) as? CompanyTableViewCell else { break }
                cell.update(with: company)
            }
        case .move:
            if let indexPath = indexPath as IndexPath? {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath as IndexPath? {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath as IndexPath? {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        @unknown default: break
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}




