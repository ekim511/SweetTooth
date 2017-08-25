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
import CoreLocation

class IceCreamSelectorViewController: UIViewController, CLLocationManagerDelegate {
    
    //MARK: - Properties
    let appId = "LRMAvc9fGrUR5riqTA5TPg"
    let appSecret = "o3WyKYuDrv9ToWN71ruMHKUFWO6S6TNBrl0qcRpktkL3UpTIEe8qmRHrvvCVLeqR"
    var businesses = [YLPBusiness]()
    var store: IceCreamStore?
    var yelpCoordinate : YLPCoordinate?

    //MARK:- IBOutlets
    @IBOutlet weak var iceCreamRandomButton: UIButton!
    @IBOutlet weak var iceCreamButtonLabel: UILabel!
    @IBOutlet weak var historyButton: UIButton!
    
    
    //MARK:-IBActions
    @IBAction func historyButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "displayHistoryViewController", sender: self)

    }
    
    @IBAction func iceCreamRandomButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "displayDetailView", sender: self)
    }
    
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        iceCreamRandomButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        historyButton.layer.masksToBounds = true
        historyButton.layer.cornerRadius = 4
        iceCreamButtonLabel.layer.masksToBounds = true
        iceCreamButtonLabel.layer.cornerRadius = 4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpLocationManager()
        iceCreamRandomButton.isEnabled = false
        

    }
    

    
    //MARK: - Location Services
    
    let locationManager = CLLocationManager()
    
    func setUpLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        guard let latitude = locationManager.location?.coordinate.latitude,
            let longitude = locationManager.location?.coordinate.longitude else {return}
        yelpCoordinate = YLPCoordinate(latitude: latitude, longitude: longitude)
        yelpQuery()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    //Return array of businesses
    func yelpQuery(){
        let query = YLPQuery(coordinate: yelpCoordinate!)
        query.term = "ice cream"
        query.limit = 10
        query.radiusFilter = 560
        
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
    
    //Choose random business
    func getStore() -> IceCreamStore {
        let randomIndex = Int(arc4random_uniform(UInt32(self.businesses.count)))
        let randomBusiness = self.businesses[randomIndex]
        return IceCreamStore(object : randomBusiness)
    }
    
    //MARK:- Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayDetailView" {
                print("Random ice cream button tapped")
                let iceCreamDetailViewController = segue.destination as! IceCreamDetailViewController
                iceCreamDetailViewController.store = self.store
            }
        }
    }

    @IBAction func unwindToIceCreamSelectorViewController (_segue : UIStoryboardSegue) {
        
    }
}
