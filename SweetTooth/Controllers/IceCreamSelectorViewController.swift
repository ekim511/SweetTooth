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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Properties
    
    @IBOutlet weak var iceCreamRandomButton: UIButton!
    
    @IBAction func iceCreamRandomButtonTapped(_ sender: UIButton) {
    }
    
    @IBOutlet weak var iceCreamButtonLabel: UILabel!
    
    @IBOutlet weak var historyButton: UIButton!
    
    @IBAction func historyButtonTapped(_ sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
