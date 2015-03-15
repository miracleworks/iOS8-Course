//
//  ViewController.swift
//  Postcard
//
//  Created by SHITAL DESAI on 3/14/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var enterNameTextField: UITextField!
    
    @IBOutlet weak var enterMessageTextField: UITextField!

    @IBOutlet weak var mailButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMailButtonPressed(sender: UIButton) {
        
        // Display label and assign text
        messageLabel.hidden = false
        messageLabel.text = enterMessageTextField.text
        
        // Change text color
        messageLabel.textColor = UIColor.redColor()
        
        
        // Clear input
        enterMessageTextField.text = ""
        // Hide keyboard
        enterMessageTextField.resignFirstResponder()
        
        // Update button
        mailButton.setTitle("Mail sent", forState: UIControlState.Normal)
      
        
    }
    
    


}

