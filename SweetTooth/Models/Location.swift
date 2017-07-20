//
//  Location.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/20/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
