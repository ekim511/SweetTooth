//
//  SavedIceCreamStoreCell.swift
//  SweetTooth
//
//  Created by Eliott Kim on 8/25/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

class SavedIceCreamStoreCell : UITableViewCell{
    
    //MARK:- Properties
    
    var store: SavedIceCreamStore?

    
    //MARK:- IBOutlets
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var directionsButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    
    //MARK:- IBActions
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
  
    @IBAction func directionsButtonTapped(_ sender: Any) {
    }
    
    //MARK:- Methods

}
