//
//  ParseModel.swift
//  DemoExercises
//
//  Created by Katty Quintero on 28/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseModel {
    
    func parseJson(withValue value: Any) -> [TopAppModel] {
        
        var arrayModel = [TopAppModel]()
        
        let json = JSON(value)
        let dicc = json["feed"].dictionary
        let appArray = dicc?["results"]?.array
        
        for array in appArray! {
            let model = TopAppModel(image: array["artworkUrl100"].stringValue,
                                    name: array["name"].stringValue,
                                    Company: array["artistName"].stringValue,
                                    appId: array["id"].stringValue)
            arrayModel.append(model)
        }
        return arrayModel
    }
    
    func parseId(withValue value: Any) -> DetailAppModel? {
        
        let json = JSON(value)
        let arrayDetails = json["results"].arrayValue
        
        if !arrayDetails.isEmpty {
            let model = DetailAppModel(image: arrayDetails[0]["artworkUrl100"].stringValue,
                                        name: arrayDetails[0]["trackName"].stringValue,
                                        company: arrayDetails[0]["sellerName"].stringValue,
                                        appId: arrayDetails[0]["trackId"].stringValue,
                                        points: arrayDetails[0]["averageUserRating"].stringValue,
                                        number: arrayDetails[0]["formattedPrice"].stringValue,
                                        age: arrayDetails[0]["contentAdvisoryRating"].stringValue,
                                        type: arrayDetails[0]["primaryGenreName"].stringValue,
                                        imageCollection: images(from: arrayDetails[0]["screenshotUrls"].arrayObject))
            return model
        }
        return nil
    }
    //function to convert an array any into array string
    private func images(from array: [Any]?) -> [String] {
        guard let images = array, let arrayImages = images as? [String] else { return [""] }
        
        return arrayImages
    }
    
    
}
