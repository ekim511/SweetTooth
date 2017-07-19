//
//  IceCreamSelectorViewController.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit
import YelpAPI
import BrightFutures

class IceCreamSelectorViewController: UIViewController {
    
    let appId = "LRMAvc9fGrUR5riqTA5TPg"
    let appSecret = "o3WyKYuDrv9ToWN71ruMHKUFWO6S6TNBrl0qcRpktkL3UpTIEe8qmRHrvvCVLeqR"
    var businesses = [YLPBusiness]()
    var store: IceCreamStore?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yelpQuery()
        iceCreamRandomButton.isEnabled = false
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var iceCreamRandomButton: UIButton!
    @IBOutlet weak var iceCreamButtonLabel: UILabel!
    @IBOutlet weak var historyButton: UIButton!
    
    @IBAction func historyButtonTapped(_ sender: UIButton) {
        
        
    }
    

    
    //Return array of businesses
    func yelpQuery(){
        let query = YLPQuery(location: "New York, NY")
        query.term = "ice cream"
        query.limit = 10
        
        YLPClient.authorize(withAppId: appId, secret: appSecret).flatMap { client in
            client.search(withQuery: query)
            }.onSuccess { search in
                self.businesses = search.businesses
                self.store = self.getStore()
                self.iceCreamRandomButton.isEnabled = true
            }.onFailure { error in
                print("Search errored: \(error)")
                exit(EXIT_FAILURE)
        }        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayDetailView" {
                print("Random ice cream button tapped")
                
                    let iceCreamDetailViewController = segue.destination as! IceCreamDetailViewController
                    iceCreamDetailViewController.store = self.store
                    print(iceCreamDetailViewController.store?.name)
                
                
                
                
                
            }
        }
    }
    
    
    //Choose random business
    func getStore() -> IceCreamStore {
        let randomIndex = Int(arc4random_uniform(UInt32(self.businesses.count)))
        let randomBusiness = self.businesses[randomIndex]
        return IceCreamStore(object : randomBusiness)
    }
}
