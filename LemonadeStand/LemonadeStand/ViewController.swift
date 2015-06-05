//
//  ViewController.swift
//  LemonadeStand
//
//  Created by SHITAL DESAI on 4/19/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    
    @IBOutlet weak var iceCubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    let price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateMainView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //IBAction Purchase
    
    @IBAction func purchaseLemonButtonPressed(sender: AnyObject) {
        if supplies.money >= price.lemon
        {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have enough money.")
        }
    }

    @IBAction func purchaseIceCubeButtonPressed(sender: AnyObject) {
        if supplies.money >= price.iceCube
        {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have enough money.")
        }
    }
    
    @IBAction func unPurchaseLemonButtonPressed(sender: AnyObject) {
        if lemonsToPurchase > 0
        {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have anything to return.")
        }
    }
    
    @IBAction func unPurchaseIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesToPurchase > 0
        {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have anything to return.")
        }
    }
    
    
    // IBAction Mix
    
    @IBAction func mixLemonButtonPressed(sender: AnyObject) {
        if supplies.lemons > 0
        {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have enough lemon inventory.")
        }
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: AnyObject) {
        if supplies.iceCubes > 0
        {
            iceCubesToPurchase  = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not have enough icecube inventory.")
        }
    }
    
    @IBAction func unMixLemonButtonPressed(sender: AnyObject) {
        if lemonsToMix > 0
        {
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not anything to unMix.")
        }
    }
    
    @IBAction func unMixIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesToMix > 0
        {
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        }
        else
        {
            showAlertWithText(message: "You do not anything to unMix.")
        }
    }
    
    
    // IBAction Start
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        
        let customers = Int(arc4random_uniform(UInt32(11)))
        println("Customers: \(customers)")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            showAlertWithText(message: "You need to add atleast 1 :Lemon and 1 Ice Cube")
        }
        else
        {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
            
            for x in 0...customers {
                let preference = Double(arc4random_uniform(UInt32(101))) / 100
                
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                }
                else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1
                {
                    supplies.money += 1
                }
                else
                {
                    println("else statement evaluating")
                }
            }
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
            updateMainView()
        }
    }
    
    
    
        
        
        
    
    
    
        
        
        
        
    
    // ----------------
    // Helper Functions
    // ----------------  
    
    func updateMainView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "$\(supplies.lemons)"
        iceCubeSupplyCount.text = "$\(supplies.iceCubes)"
        
        lemonPurchaseCount.text = "$\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "$\(iceCubesToPurchase)"
        
        lemonMixCount.text = "$\(lemonsToMix)"
        iceCubeMixCount.text = "$\(iceCubesToMix)"
    }
    
    func showAlertWithText(header: String = "Warning", message : String)
    {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
}
