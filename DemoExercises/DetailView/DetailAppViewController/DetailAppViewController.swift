//
//  DetailAppViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 30/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import Kingfisher

let detailCell = 0
let screenShotCell = 1

class DetailAppViewController: UIViewController, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var detailModel: DetailAppModel?
    var IdApp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    //MARK: -FUNCTIONS
    func getData() {
        Networking().getData(url: "https://itunes.apple.com/lookup?id=\(IdApp ?? "")" , completion: { response in
            
            self.detailModel = ParseModel().parseId(withValue: (response.result.value as Any))
            self.tableView.reloadData()
        })
    }
    //MARK: -DATA SOURCE - DETAIL APLICATION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let model = detailModel else {return UITableViewCell()}
        
        if indexPath.row == detailCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailAppTableViewCell
        cell.configCell(model: model)
        
        return cell
    }
        if indexPath.row == screenShotCell {
            let screenShotCell = tableView.dequeueReusableCell(withIdentifier: "CellCollection", for: indexPath) as!
            ScreenShotTableViewCell
            screenShotCell.configCell(with: model.imageCollection)
            return screenShotCell
        }
        return UITableViewCell()
  }
}
