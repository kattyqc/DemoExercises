//
//  DetailAppTableViewCell.swift
//  DemoExercises
//
//  Created by Katty Quintero on 30/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

class DetailAppTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImgView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailCompanyLabel: UILabel!
    @IBOutlet weak var detailPointsLabel: UILabel!
    @IBOutlet weak var detailNumberLabel: UILabel!
    @IBOutlet weak var detailTypeLabel: UILabel!
    @IBOutlet weak var detailAgeLabel: UILabel!
    
    func configCell(model: DetailAppModel) {
        
        let url = URL(string: model.image)
        detailImgView.kf.setImage(with: url)
        detailNameLabel.text = model.name
        detailCompanyLabel.text = model.Company
        detailPointsLabel.text = model.points
        detailNumberLabel.text = model.number
        detailTypeLabel.text = model.type
        detailAgeLabel.text = model.age
        detailImgView.layer.cornerRadius = 15
        detailImgView.layer.borderWidth = 0.5
    }
}
