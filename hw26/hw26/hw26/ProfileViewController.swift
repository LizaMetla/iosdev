//
//  ProfileViewController.swift
//  hw26
//
//  Created by Елизавета Метла on 10/11/20.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        handleSignOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserInfo()
 
    }
    
    // MARK: - Log out
    
    func logOut() {
        //логика для перехода на 1 контроллер
        do {
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            
        } catch let error {
            showAlert(message: "Sign out error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Load user email
    
    func loadUserData() {
        
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            emailLabel.text = email
        }
        
    }
    
    // MARK: - Check user information
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            loadUserData()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    
    // MARK: - Selectors
    
    @objc func handleSignOut() {
        let alertController = UIAlertController(title: nil, message: "Are you sure that you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign out", style: .destructive, handler: { (_) in
            self.logOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Log out", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
