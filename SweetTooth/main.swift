//
//  main.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//


import Foundation
import YelpAPI
import BrightFutures

// Fill in your app keys here from
// https://www.yelp.com/developers/v3/manage_app
let appId = "LRMAvc9fGrUR5riqTA5TPg"
let appSecret = "o3WyKYuDrv9ToWN71ruMHKUFWO6S6TNBrl0qcRpktkL3UpTIEe8qmRHrvvCVLeqR"

// Search for 3 dinner restaurants
let query = YLPQuery(location: "New York, NY")
query.term = "ice cream"
query.limit = 3

//YLPClient.authorize(withAppId: appId, secret: appSecret, completionHandler: <#(YLPClient?, Error?) -> Void#>).flatMap { client in
//    client.search(withQuery: query)
//    }.onSuccess { search in
//        if let topBusiness = search.businesses.first {
//            print("Top business: \(topBusiness.name), id: \(topBusiness.identifier)")
//        } else {
//            print("No businesses found")
//        }
//        exit(EXIT_SUCCESS)
//    }.onFailure { error in
//        print("Search errored: \(error)")
//        exit(EXIT_FAILURE)
//}
//
//dispatchMain()



