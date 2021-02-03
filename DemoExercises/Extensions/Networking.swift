//
//  Networking.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    
    func getData(url: String, completion: @escaping (DataResponse<Any>) -> Void ) {
        
        Alamofire.request(url).responseJSON { response in
            completion(response)
        }
    }
}
