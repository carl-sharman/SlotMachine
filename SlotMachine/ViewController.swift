//
//  ViewController.swift
//  SlotMachine
//
//  Created by Carl Sharman on 15/01/2015.
//  Copyright (c) 2015 United Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    // Information labels
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    // Buttons in fourth container
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    var slots:[[Slot]] = []
    
    let kMarginForView: CGFloat = 10.0
    let kMarginForSlot: CGFloat = 2.0
    
    let kSixth: CGFloat = 1.0 / 6.0
    let kThird: CGFloat = 1.0 / 3.0
    let kHalf: CGFloat = 1.0 / 2.0
    let kEighth: CGFloat = 1.0 / 8.0
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupContainerViews()
        self.setupFirstContainer(self.firstContainer)
        self.setupSecondContainer(self.secondContainer)
        self.setupThirdContainer(self.thirdContainer)
        self.setupFourthContainer(self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
    
    func resetButtonPressed(button: UIButton) {
        println("resetButtonPressed")
    }
    
    func betOneButtonPressed(button: UIButton) {
        println(button)
    }
    
    func betMaxButtonPresssed(button: UIButton) {
        
    }
    
    func spinButtonPressed(button: UIButton) {
        self.slots = Factory.createSlots()
        self.setupSecondContainer(self.secondContainer)
    }
    
    func setupContainerViews() {
        // First container
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (self.kMarginForView * 2), height: self.view.bounds.height * self.kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        // Second container
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.firstContainer.frame.height, width: self.view.bounds.width - (self.kMarginForView * 2), height: self.view.bounds.height * (3 * self.kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        // Third container
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height, width: self.view.bounds.width - (self.kMarginForView * 2), height: self.view.bounds.height * self.kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        // Fourth container
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + self.kMarginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height + self.thirdContainer.frame.height, width: self.view.bounds.width - (self.kMarginForView * 2), height: self.view.bounds.height * self.kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        for var containerNumber = 0; containerNumber < self.kNumberOfContainers; containerNumber++ {
            
            for var slotNumber = 0; slotNumber < self.kNumberOfSlots; slotNumber++ {
                
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * self.kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * self.kThird), width: containerView.bounds.width * self.kThird - kMarginForSlot, height: containerView.bounds.height * self.kThird - self.kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        // Credits label
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * self.kSixth, y: containerView.frame.height * self.kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        // Bet label
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * self.kSixth * 3, y: containerView.frame.height * self.kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        // Winner paid label
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * self.kSixth * 5, y: containerView.frame.height * self.kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        // Credits title label
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * self.kSixth, y: containerView.frame.height * self.kThird * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        // Bet title label
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * self.kSixth * 3, y: containerView.frame.height * self.kThird * 2)
        containerView.addSubview(self.betTitleLabel)
        
        // Winner paid title label
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "Winner Paid"
        self.winnerPaidLabel.textColor = UIColor.blackColor()
        self.winnerPaidLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * self.kSixth * 5, y: containerView.frame.height * self.kThird * 2)
        containerView.addSubview(self.winnerPaidLabel)
    }
    
    func setupFourthContainer(containerView: UIView) {
        // Reset button
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * self.kEighth, y: containerView.frame.height * self.kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        // Bet One button
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * 3 * self.kEighth, y: containerView.frame.height * self.kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        // Bet Max button
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("BetMax", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-bold", size: 12)
        self.betMaxButton.backgroundColor = UIColor.redColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * 5 * self.kEighth, y: containerView.frame.height * self.kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPresssed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-bold", size: 12)
        self.spinButton.backgroundColor = UIColor.greenColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * 7 * self.kEighth, y: containerView.frame.height * self.kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }
}

