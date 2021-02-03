//
//  ScreenShotTableViewCell.swift
//  DemoExercises
//
//  Created by Katty Quintero on 31/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

class ScreenShotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgCollectionView: UICollectionView! {
        didSet {
            imgCollectionView.dataSource = self
        }
    }
    
    var screenShots: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(with images: [String]) {
        self.screenShots = images
    }
}

extension ScreenShotTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenShots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellImages", for: indexPath) as? DetailAppCollectionViewCell else { return UICollectionViewCell() }
        guard let model = screenShots else { return UICollectionViewCell() }
        cell.configCell(with: model[indexPath.row])
        
        return cell
    }
}
