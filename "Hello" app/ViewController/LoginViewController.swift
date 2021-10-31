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
    
    private let userV = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNamelabel.delegate = self
        passwordLabel.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
               if let welcomeVC = viewController as? WelcomeViewController {
                   welcomeVC.userWelcomeLabel = userV.applicationUser
                   tabBarController.selectedIndex = 1
               } else if let aboutMeSegue = viewController as? UINavigationController {
                   let aboutUserVC = aboutMeSegue.topViewController as! AboutMeViewController
                   aboutUserVC.aboutMeLabelText = userV.aboutMe.hobby
               }
        }
    }
    
// MARK: IBActions func
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNamelabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func logInPressed() {
        if userNamelabel.text != userV.nameUser || passwordLabel.text != userV.passwordUser {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password"
            )
        }
    }
    
    
    @IBAction func forgotName() {
        showAlert(title: "Enter a name in the name field ☘️", message: "Your name is \(userV.nameUser)")
    }
    
    
    @IBAction func forgotPassword() {
        showAlert(title: "Enter your password in the password field 🌿", message: "Your password is \(userV.passwordUser).")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}

// MARK: Private Methods

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
            passwordLabel.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "welcomeVC", sender: self)
            }
    return true
}
    
}



