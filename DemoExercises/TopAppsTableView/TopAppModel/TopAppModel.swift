//
//  TopAppModel.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

class TopAppModel: NSObject {
    
    var image: String
    var name: String
    var Company: String
    var appId: String
    
    init(image: String, name: String, Company: String, appId: String) {
        self.image = image
        self.name = name
        self.Company = Company
        self.appId = appId
    }
}
