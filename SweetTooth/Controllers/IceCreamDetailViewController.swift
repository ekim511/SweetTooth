//
//  IceCreamDetailViewController.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit
import AlamofireImage
import MessageUI
import MapKit


class IceCreamDetailViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    

    //MARK:- IBOutlets
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var storePicImageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var locationLabelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: - Properties
    var store : IceCreamStore?
    var savedStores: [IceCreamStore] = []

    //MARK:- Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = store?.name {
            storeNameLabel.text = name.uppercased()
        }
        if let location = store?.fullAddress {
            locationLabelButton.setTitle(location, for: .normal)
            locationLabelButton.titleLabel?.numberOfLines = 0
            locationLabelButton.titleLabel?.textAlignment = .center
        }
        if let rating = store?.rating {
            ratingLabel.text = "Yelp Rating: \(rating)"
        }
        if let imageURLConst = store?.imageURL {
            loadPoster(urlString: imageURLConst)
        }
        backButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        storeNameLabel.numberOfLines = 0
        storeNameLabel.adjustsFontSizeToFitWidth = true
        
    
    }

    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        storePicImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    func openMapForPlace() {
        guard let latitude: CLLocationDegrees = store?.location?.coordinate?.latitude,
            let longitude: CLLocationDegrees = store?.location?.coordinate?.longitude,
            let name = store?.name else {return}
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }

    //MARK:- IBActions
    @IBAction func locationLabelButtonTapped(_ sender: Any) {
        openMapForPlace()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: "Would you like to save this ice cream store?", preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save Ice Cream Store", style: .default) { _ in
            guard let store = self.store else {return}
            let savedStore = CoreDataHelper.newIceCreamStore()
            savedStore.name = store.name
            savedStore.fullAddress = store.fullAddress
            savedStore.rating = store.rating
            savedStore.imageURL = store.imageURL
            savedStore.url = store.url
            CoreDataHelper.saveIceCreamStore()
        }
        alertController.addAction(saveAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func shareButonTapped(_ sender: UIButton) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            guard let name = store?.name,
                let fullAddress = store?.fullAddress,
                let url = store?.url else {return}
            controller.body = "Hey! I found a great ice cream place with SweetTooth. It's called \(name) located at \(fullAddress). Here's a link to the place: \(url)!"
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK:- Segues
    @IBAction func backButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIceCreamSelectorViewController", sender: self)
    }

}
