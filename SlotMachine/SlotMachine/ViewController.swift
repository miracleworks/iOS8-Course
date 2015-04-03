//
//  ViewController.swift
//  SlotMachine
//
//  Created by SHITAL DESAI on 4/3/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Properties
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //Constants
    let kMarginForView: CGFloat = 10.0
    let kSixth: CGFloat = 1.0/6.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupContainerViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerViews()
    {
        // first container
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                        y: self.view.bounds.origin.y,
                                        width: self.view.bounds.width - (kMarginForView * 2),
                                        height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        // second container
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                        y: firstContainer.frame.height,
                                        width: self.view.bounds.width - (kMarginForView * 2),
                                        height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        // third container
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                    y: firstContainer.frame.height + secondContainer.frame.height,
                                    width: self.view.bounds.width - (kMarginForView * 2),
                                    height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        // fourth container
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                    y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                                    width: self.view.bounds.width - (kMarginForView * 2),
                                    height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
        
    }

}

