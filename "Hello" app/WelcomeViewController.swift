//
//  WelcomeViewController.swift
//  "Hello" app
//
//  Created by Варвара Фомина on 27.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = " Welcome, \(user)!"

    }

}
