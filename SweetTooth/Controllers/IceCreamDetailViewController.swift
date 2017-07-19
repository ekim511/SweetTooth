//
//  IceCreamDetailViewController.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit

class IceCreamDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var repickRandomIceCreamButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!

    @IBOutlet weak var ratingLabel: UILabel!
    var store : IceCreamStore?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeNameLabel.text = store?.name
        locationLabel.text = store?.getAddress()
        ratingLabel.text = String(describing: store?.rating)
        //storePicture = store?.imageURL
        
    
        
        
        
        
    }



    
    @IBAction func repickRandomIceCreamButtonTapped(_ sender: UIButton) {
        
        
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
        
    }
    


}
