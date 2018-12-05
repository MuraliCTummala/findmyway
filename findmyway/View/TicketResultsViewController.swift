//
//  TicketResultsViewController.swift
//  findmyway
//
//  Created by Murali Tummala on 12/3/18.
//  Copyright © 2018 Murali Tummala. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON



class TicketResultsViewController: UIViewController{
    
    @IBOutlet weak var pnrLael: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad(){
        let pnr = UserDefaults.standard.string(forKey:"pnr")
        pnrLael.text = pnr
        let flightAwareService = FlightAwareService()
        flightAwareService.apiCall(){ (result) in
            print(result)
            let origin = result["origin"].stringValue
            self.displayLabel.text = origin
        }
        flightAwareService.apiflightSchedules(flightNumber: pnr!){ (result) in
            print(result)
        }
    }
    
}
