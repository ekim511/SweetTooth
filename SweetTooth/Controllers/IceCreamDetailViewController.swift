//
//  IceCreamDetailViewController.swift
//  SweetTooth
//
//  Created by Eliott Kim on 7/18/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import UIKit

class IceCreamDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var repickRandomIceCreamButton: UIButton!

    @IBAction func repickRandomIceCreamButtonTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
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
