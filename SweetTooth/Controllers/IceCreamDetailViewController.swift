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


class IceCreamDetailViewController: UIViewController/*/, MFMessageComposeViewControllerDelegate */ {
    
    //MARK: - Properties
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var repickRandomIceCreamButton: UIButton!


    @IBOutlet weak var locationLabel: UILabel!

    @IBOutlet weak var ratingLabel: UILabel!
    
    var store : IceCreamStore?
    
    @IBOutlet weak var storePicImageView: UIImageView!
    
    @IBOutlet weak var shareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = store?.name {
            storeNameLabel.text = name.uppercased()
        }
        if let location = store?.fullAddress {
            locationLabel.text = location
        }
        if let rating = store?.rating {
            ratingLabel.text = "Yelp Rating: \(rating)"
        }
        if let imageURLConst = store?.imageURL {
            loadPoster(urlString: imageURLConst)
        }
        repickRandomIceCreamButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
    
    }

    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        storePicImageView.af_setImage(withURL: URL(string: urlString)!)
    }

    
    @IBAction func repickRandomIceCreamButtonTapped(_ sender: UIButton) {
        
    }


    @IBAction func shareButonTapped(_ sender: UIButton) {
       /* if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Hi! I just found a great ice cream place! Here it is! \(store?.fullAddress)"
            controller.recipients = []
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }*/
    }
    
    /*func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }*/
    


      
    


}
