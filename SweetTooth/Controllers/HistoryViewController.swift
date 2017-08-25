//
//  HistoryViewController.swift
//  SweetTooth
//
//  Created by Eliott Kim on 8/25/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit
import AlamofireImage

class HistoryViewController: UIViewController, UITableViewDelegate {
    
    //MARK:- Properties
    var stores = [SavedIceCreamStore]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var savedIceCreamStoresLabel: UILabel!
    
    
    //MARK:- IBActions
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        stores = CoreDataHelper.retrieveIceCreamStores()
        configureTableView()
        savedIceCreamStoresLabel.layer.masksToBounds = true
        savedIceCreamStoresLabel.layer.cornerRadius = 4
    }
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    //MARK:- Segues
    @IBAction func backButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIceCreamSelectorViewController", sender: self)
    }
    
    @IBAction func displayHistoryViewController (_segue : UIStoryboardSegue) {
        self.stores = CoreDataHelper.retrieveIceCreamStores()
    }

}
extension HistoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedIceCreamStoreCell", for: indexPath) as! SavedIceCreamStoreCell
        let row = stores.count - indexPath.row - 1
        let store = stores[row]
        cell.store = store
        
        cell.directionsButton.isHidden = true
        cell.shareButton.isHidden = true
        cell.directionsButton.layer.cornerRadius = 4
        cell.shareButton.layer.cornerRadius = 4
        
        cell.storeNameLabel.text = store.name
        cell.addressLabel.text = store.fullAddress
        
        if let rating = store.rating {
            cell.ratingLabel.text = "Rating: \(rating)"

        }
        
        cell.storeImageView.af_setImage(withURL: URL(string: store.imageURL!)!)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = cell.storeImageView.bounds
        blurEffectView.alpha = 0.80
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cell.storeImageView.addSubview(blurEffectView)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.delete(iceCreamStore: stores[stores.count - indexPath.row - 1])
            //2
            stores = CoreDataHelper.retrieveIceCreamStores()
        }
    }
}
