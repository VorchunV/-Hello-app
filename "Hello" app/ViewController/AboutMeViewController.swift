//
//  AboutMeViewController.swift
//  "Hello" app
//
//  Created by Варвара Фомина on 31.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    
    
    @IBOutlet var aboutMeLabel: UILabel!
    var aboutMeLabelText = ""
    private let userV = User.getUser()

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 50
        aboutMeLabel.text = "\(aboutMeLabelText))"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HobbyViewController {
            let hobby = segue.destination as? HobbyViewController
            hobby?.hobbyLabelText = userV.aboutMe.resume
        }
    }
}
