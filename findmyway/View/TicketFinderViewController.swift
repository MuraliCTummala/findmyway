//
//  ViewController.swift
//  findmyway
//
//  Created by Murali Tummala on 12/3/18.
//  Copyright © 2018 Murali Tummala. All rights reserved.
//

import UIKit

class TicketFinderViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var ticketTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonTouched(_ sender: Any) {
        savePnr(pnr: ticketTextView.text!)
    }
    
    private func savePnr(pnr: String){
        let str = UserDefaults.standard
        str.set(pnr, forKey: "pnr")
    }
    
    private func isValidPnr() -> Bool {
        if ticketTextView.text?.count == 6 {
            return true;
        } else {
            return false;
        }
    }
}

