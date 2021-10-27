//
//  ViewController.swift
//  "Hello" app
//
//  Created by Варвара Фомина on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNamelabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    
    private let user = "Varvara"
    private let password = "VarvaraG"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNamelabel.delegate = self
        passwordLabel.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.userWelcomeLabel = user
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNamelabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func logInPressed() {
        if userNamelabel.text != user || passwordLabel.text != password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password"
            )
        }
    }
    
    
    @IBAction func forgotName() {
        showAlert(title: "Enter a name in the name field ☘️", message: "Your name is \(user)")
    }
    
    
    @IBAction func forgotPassword() {
        showAlert(title: "Enter your password in the password field 🌿", message: "Your password is \(password).")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

}

extension ViewController: UITextFieldDelegate {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordLabel.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNamelabel {
            textField.resignFirstResponder()
            passwordLabel.becomeFirstResponder()
        } else if textField == passwordLabel {
            textField.resignFirstResponder()
            self.logInPressed()
            self.performSegue(withIdentifier: "welcomeVC", sender: self)
        }
        return true
    }
    
}



