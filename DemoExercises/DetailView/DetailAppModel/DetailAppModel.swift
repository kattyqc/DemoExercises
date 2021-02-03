//
//  DetailAppModel.swift
//  DemoExercises
//
//  Created by Katty Quintero on 30/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

class DetailAppModel: TopAppModel {
    
    var points: String
    var number: String
    var age: String
    var type: String
    var imageCollection: [String]
    
    init(image: String, name: String, company: String, appId: String, points: String, number: String, age: String, type: String, imageCollection: [String]) {
        self.points = points
        self.number = number
        self.age = age
        self.type = type
        self.imageCollection = imageCollection
    
        super.init(image: image, name: name, Company: company, appId: appId)
    }
}
