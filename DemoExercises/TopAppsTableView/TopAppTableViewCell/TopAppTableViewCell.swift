//
//  TopAppTableViewCell.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import Kingfisher

class TopAppTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    func configCell(model: TopAppModel, index: Int) {
        
        let url = URL(string: model.image)
        imgView.kf.setImage(with: url)
        nameLabel.text = model.name
        companyLabel.text = model.Company
        numberLabel.text = ("\(index)")
        imgView.layer.borderWidth = 0.5
        imgView.layer.cornerRadius = 20
    }
}
