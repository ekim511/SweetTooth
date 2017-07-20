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
    var rating : String?
    var imageURL : String?
    
    var location : YLPLocation?
    var address = ""
    var city = ""
    var state = ""
    var zipCode = ""
    var fullAddress = ""
    
    init(object: YLPBusiness){
        self.name = object.name
        self.location = object.location
        self.rating = String(describing:object.rating)
        
        if let imageURLConst = object.imageURL {
            self.imageURL = String(describing :imageURLConst)
        }
        
        setAddress()
    }
    
    func setAddress() {
        address = (location?.address[0])!
        city = (location?.city)!
        state = (location?.stateCode)!
        zipCode = (location?.postalCode)!
        fullAddress = "\(address), \(city), \(state) \(zipCode)"
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
