//
//  ViewController.swift
//  AgeOfLalka
//
//  Created by SHITAL DESAI on 3/20/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var humanYearsTextField: UITextField!
    @IBOutlet weak var dogYearsLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButtonPressed(sender: UIButton) {
    
        var humanYearsInteger = humanYearsTextField.text.toInt()!
        
        
        dogYearsLabel.hidden = false
        dogYearsLabel.text = "\(humanYearsInteger * 7)" + " Human years!"
        
        humanYearsTextField.resignFirstResponder()
    
    }

}

