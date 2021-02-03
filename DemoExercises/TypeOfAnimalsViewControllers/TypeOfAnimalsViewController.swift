//
//  TypeOfAnimalsViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

class TypeOfAnimalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let animalsClassification = ["Herbívoros", "Carnívoros", "Omnívoros"]
    
    let TypeOfAnimals = [["Cebra", "Jirafa", "Elefante", "Caballo", "Conejo"],["Tigre", "Cocodrilo", "Perro", "Oso", "Tiburón"], ["Cerdos", "Zorros", "Ardillas", "Gallinas", "Erizos"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Animals Classification"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //asi establecemos una celda a traves de codigo
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalsClassification.count
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TypeOfAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let name = TypeOfAnimals[indexPath.section][indexPath.row]
        cell?.textLabel?.text = name
        cell?.backgroundColor = UIColor(hex: "90BC6B")
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return animalsClassification[section]
    }
}
