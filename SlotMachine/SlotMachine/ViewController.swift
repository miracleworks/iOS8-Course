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
    
    var titleLabel: UILabel!
    
    // Info labels
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerLabel: UILabel!
    var creditsTitleLabel : UILabel!
    var beltTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    
    // Buttons in fourth container
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    // Stats
    var slots: [[Slot]] = []
    var credits = 0
    var currentBet = 0
    var winnings = 0
    
    
    let kNumberOfContainers = 3 //Columns
    let kNumberOfSlots = 3 //rows
    
    
    //Constants
    let kMarginForView: CGFloat = 10.0
    let kMarignForSlot: CGFloat = 2.0
    
    let kSixth: CGFloat = 1.0/6.0
    let kThird: CGFloat = 1.0/3.0
    let kHalf: CGFloat = 1.0/2.0
    let kEight: CGFloat = 1.0/8.0
    
    
    //IBActions
    func resetButtonPressed(button: UIButton)
    {
        hardReset()
    }
    
    func betOneButtonPressed(button: UIButton)
    {
        if credits <= 0
        {
            showAlertWithText(header: "No more credits", message: "Reset Game")
        }
        else
        {
            if currentBet < 5
            {
                currentBet += 1
                credits -= 1
                updateMainView()
            }
            else
            {
                showAlertWithText(message: "You can only bet 5 credits at a time!")
            }
        }
    }
    
    func betMaxButtonPressed(button: UIButton)
    {
        if credits <= 5
        {
            showAlertWithText(header: "Not enough credits", message: "Bet less")
            
        }
        else
        {
            if currentBet < 5
            {
                var creditsToBetMax = 5 - currentBet
                credits -= creditsToBetMax
                currentBet += creditsToBetMax
                updateMainView()
            }
            else
            {
                showAlertWithText(message: "You can only bet 5 credits at a time!")
            }
        }
        
    }
    
    func spinButtonPressed(button: UIButton)
    {
        removeSlotImageViews()
        slots = Factory.CreateSlots()
        setupSecondContainer(self.secondContainer)
        
        
        var winningsMultiplier = SlotBrain.computeWinnings(slots)
        winnings = winningsMultiplier * currentBet
        credits += winnings
        currentBet = 0
        
        updateMainView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.setupContainerViews()
        self.setupFirstContainer(firstContainer)
        //self.setupSecondContainer(secondContainer)
        self.setupThirdContainer(thirdContainer)
        self.setupFourthContainer(fourthContainer)
        
        hardReset()
        
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
    
    func setupFirstContainer(containerView: UIView)
    {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView)
    {
        for var containerNumber = 0 ; containerNumber < kNumberOfContainers; ++containerNumber
        {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber
            {
                var slot:Slot
                var slotImageView = UIImageView()
                
                // Assign image
                if slots.count != 0
                {
                    // Get image
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else
                {
                    slotImageView.image = UIImage(named: "Ace")
                }               
                
                
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                        width: containerView.bounds.width * kThird - kMarignForSlot, height: containerView.bounds.height * kThird - kMarignForSlot)
                containerView.addSubview(slotImageView)
                
                
                
                
            }
        }
    }
    
    func setupThirdContainer(containerView: UIView)
    {
        creditsLabel = UILabel()
        creditsLabel.text = "000000"
        creditsLabel.textColor = UIColor.redColor()
        creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        creditsLabel.sizeToFit()
        creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        creditsLabel.textAlignment = NSTextAlignment.Center
        creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(creditsLabel)
        
        betLabel = UILabel()
        betLabel.text = "0000"
        betLabel.textColor = UIColor.redColor()
        betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        betLabel.sizeToFit()
        betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        betLabel.textAlignment = NSTextAlignment.Center
        betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(betLabel)
        
        winnerLabel = UILabel()
        winnerLabel.text = "000000"
        winnerLabel.textColor = UIColor.redColor()
        winnerLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        winnerLabel.sizeToFit()
        winnerLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
        winnerLabel.textAlignment = NSTextAlignment.Center
        winnerLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(winnerLabel)
        
        creditsTitleLabel = UILabel()
        creditsTitleLabel.text = "Credits"
        creditsTitleLabel.textColor = UIColor.blackColor()
        creditsTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        creditsTitleLabel.sizeToFit()
        creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2)
        creditsTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(creditsTitleLabel)
        
        beltTitleLabel = UILabel()
        beltTitleLabel.text = "Bet"
        beltTitleLabel.textColor = UIColor.blackColor()
        beltTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        beltTitleLabel.sizeToFit()
        beltTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
        beltTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(beltTitleLabel)
      
        winnerPaidTitleLabel = UILabel()
        winnerPaidTitleLabel.text = "Winner Paid"
        winnerPaidTitleLabel.textColor = UIColor.blackColor()
        winnerPaidTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        winnerPaidTitleLabel.sizeToFit()
        winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 2)
        winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(winnerPaidTitleLabel)

        
    }
    
    func setupFourthContainer(containerView: UIView)
    {
        resetButton = UIButton()
        resetButton.setTitle("Reset", forState: UIControlState.Normal)
        resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        resetButton.backgroundColor = UIColor.lightGrayColor()
        resetButton.sizeToFit()
        resetButton.center = CGPoint(x: containerView.frame.width * kEight, y: containerView.frame.height * kHalf)
        resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(resetButton)
        
        betOneButton  = UIButton()
        betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        betOneButton.backgroundColor = UIColor.greenColor()
        betOneButton.sizeToFit()
        betOneButton.center = CGPoint(x: containerView.frame.width * 3 * kEight, y: containerView.frame.height * kHalf)
        betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betOneButton)
        
        betMaxButton  = UIButton()
        betMaxButton.setTitle("BetMax", forState: UIControlState.Normal)
        betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        betMaxButton.backgroundColor = UIColor.redColor()
        betMaxButton.sizeToFit()
        betMaxButton.center = CGPoint(x: containerView.frame.width * 5 * kEight, y: containerView.frame.height * kHalf)
        betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(betMaxButton)
        
        spinButton  = UIButton()
        spinButton.setTitle("Spin", forState: UIControlState.Normal)
        spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        spinButton.backgroundColor = UIColor.greenColor()
        spinButton.sizeToFit()
        spinButton.center = CGPoint(x: containerView.frame.width * 7 * kEight, y: containerView.frame.height * kHalf)
        spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(spinButton)
      
        
    }
    
    func removeSlotImageViews()
    {
        if self.secondContainer != nil
        {
            let container:UIView? = self.secondContainer!
            let subViews:Array? = container!.subviews
            
            for view in subViews!
            {
                view.removeFromSuperview()
            }
        }
    }
    
    func hardReset()
    {
        removeSlotImageViews()
        slots.removeAll(keepCapacity: true)
        self.setupSecondContainer(self.secondContainer)
        
        credits = 50
        winnings = 0
        currentBet = 0
        
        updateMainView()
    }
    
    func updateMainView()
    {
        self.creditsLabel.text = "\(credits)"
        self.betLabel.text = "\(currentBet)"
        self.winnerLabel.text = "\(winnings)"
    }
    
    func showAlertWithText(header:String = "Warning", message:String)
    {
        // Add alert
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        // Add action for user to perform on alert
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        // Add to view
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    

}

