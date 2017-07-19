//
//  iceCreamStore.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import Foundation
import YelpAPI

class IceCreamStore {
    var name : String!
    var location : NSObject?
    //var price : Double?
    var rating : Double?
    var imageURL : URL?
    
    init(object: YLPBusiness){
        self.name = object.name
        self.location = object.location
        self.rating = object.rating
        self.imageURL = object.imageURL
        
        
    }
    
//    init(dictionary : [String : Any]) {
//        self.name = dictionary["name"] as? String
//        
//        let imageURLString = dictionary["image_url"] as? String
//        if imageURLString != nil {
//            self.imageURL = URL(string: imageURLString!)!
//        }
//        
//        self.location = dictionary["location"] as? NSDictionary
//        var address = ""
//        if location != nil {
//            let addressArray = location!["address"] as? NSArray
//            if addressArray != nil && addressArray!.count > 0 {
//                address = addressArray![0] as! String
//            }
//        }
//    }
}
