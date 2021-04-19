//
//  TopAppViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class TopAppViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var appTop = [TopAppModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJson()
        self.showSpinner(onView: self.view)
    }
    
    //MARK: - FUNCTIONS
    func getJson() {
        
        Networking().getData(url: "https://rss.itunes.apple.com/api/v1/es/ios-apps/top-free/all/100/explicit.json") { response in
            
            self.appTop = ParseModel().parseJson(withValue: (response.result.value as Any))
            self.tableView.reloadData()
            self.removeSpinner()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appTop.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TopAppTableViewCell
        let model = appTop[indexPath.row]
        cell.configCell(model: model, index: indexPath.row + 1)
        return cell
    }

    //MARK: -DELEGATE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailView") as! DetailAppViewController
        let model = appTop[indexPath.row]
        detailVC.IdApp = model.appId

        navigationController?.pushViewController(detailVC, animated: true)
    }
}
