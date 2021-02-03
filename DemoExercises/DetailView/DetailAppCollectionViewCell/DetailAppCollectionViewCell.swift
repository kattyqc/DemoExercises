//
//  DetailAppCollectionViewCell.swift
//  DemoExercises
//
//  Created by Katty Quintero on 30/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import Kingfisher

class DetailAppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configCell(with image: String) {
        
        self.imageView.kf.setImage(with: URL(string: image)!)
    }
}
