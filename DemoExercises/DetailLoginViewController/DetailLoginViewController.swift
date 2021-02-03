//
//  DetailLoginViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 27/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import Kingfisher

class DetailLoginViewController: UIViewController {

    @IBOutlet weak var imgViewFacebook: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var imageUrl: URL?
    var nameFdk : String?
    var lastName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        checkSaveRegister()
    }
    
    func converUrlToImage(image: URL) {

        imgViewFacebook.kf.setImage(with: image)
    }
    
    func configViews() {
        if let name = nameFdk {
            nameLabel.text  = name
        } else {
            nameLabel.isHidden = true
        }
        if let lastNameSdk = lastName {
            lastNameLabel.text = lastNameSdk
        } else {
            lastNameLabel.isHidden = true
        }
        if let images = imageUrl {
            converUrlToImage(image: images)
        } else {
            imgViewFacebook.isHidden = true
        }
    }
    
    func checkSaveRegister() {
        let email = defaults.value(forKey: keys.email) as? String
            print(email ?? "")
        let password = defaults.value(forKey: keys.password) as? String
            print(password ?? "")
    }
}
