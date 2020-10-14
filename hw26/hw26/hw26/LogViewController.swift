//
//  LogViewController.swift
//  hw26
//
//  Created by Елизавета Метла on 10/10/20.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCrashlytics

class LogViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        validateFieldsLogin()
    }
    
    @IBAction func SingupButtonTiped(_ sender: Any) {
        validateFieldsSignUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - SignUp
    
    func signUp() {
        guard
            let email = emailTextField.text,
            let login = loginTextField.text,
            !email.isEmpty, !login.isEmpty
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: login) { [weak self] (result, error) in
            guard let self = self else { return }
            if let error = error as NSError? {
                self.showAlert(message: error.localizedDescription)
            } else {
                self.checkUserInfo()
            }
        }
    }
    
    //MARK: - Login
    
    func login() {
        guard
            let email = emailTextField.text,
            let login = loginTextField.text,
            !email.isEmpty, !login.isEmpty
        else { return }
        
        Auth.auth().signIn(withEmail: email, password: login) { [weak self] (result, error) in
            guard let self = self else { return }
            if let error = error as NSError? {
                self.showAlert(message: error.localizedDescription)
            } else {
                self.checkUserInfo()
            }
        }
    }
    
    //MARK: - Validation login
    
    func validateFieldsLogin() {
        if emailTextField.text?.isEmpty == true || loginTextField.text?.isEmpty == true {
            self.showAlert(message: "Please fill in all fields!")
        }
        login()
    }
    
    //MARK: - Validation Sign Up
    
    func validateFieldsSignUp() {
        if emailTextField.text?.isEmpty == true || loginTextField.text?.isEmpty == true {
            self.showAlert(message: "Please fill in all fields!")
        }
        signUp()
    }
    
    //MARK: - Show user info
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Bar")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    
    // MARK: - Private
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Authorization", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
