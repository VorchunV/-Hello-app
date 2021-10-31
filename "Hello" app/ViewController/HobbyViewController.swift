//
//  HobbyViewController.swift
//  "Hello" app
//
//  Created by Варвара Фомина on 31.10.2021.
//

import UIKit

class HobbyViewController: UIViewController {

    @IBOutlet var hobbyLabel: UILabel!
    var hobbyLabelText = ""
    
    @IBOutlet var imageViewHobby: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewHobby.layer.cornerRadius = 50
        hobbyLabel.text = "\(hobbyLabelText)"

    }
    

}
