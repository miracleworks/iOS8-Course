//
//  ViewController.swift
//  ControlFlow-xCode
//
//  Created by SHITAL DESAI on 3/20/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let truckSpeed = 45
        let lamboSpeed = 120
        var mySpeed:Int
        mySpeed = 55
        
        
        if mySpeed < 70{
            println("Keep Cruising")
        }
        else {
            println("Slow down police ahead!")
        }
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

