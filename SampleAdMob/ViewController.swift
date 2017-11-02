//
//  ViewController.swift
//  SampleAdMob
//
//  Created by Futurismworks on 2017/11/02.
//  Copyright © 2017年 Futurismworks. All rights reserved.
//

import UIKit
// import iAd
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    // AdMob ID を入れてください
    let AdMobID = "[Your AdMob ID]"
    let TestID = "ca-app-pub-3940256099942544/2934735716" // for test
    
    // Your TestDevice ID
    let DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    
    let AdMobTest = true
    let SimulatorTest = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        var admobView = GADBannerView()
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPoint(x:0,
                                         y:self.view.frame.size.height - admobView.frame.height)
        
        admobView.frame.size = CGSize(width:self.view.frame.width,
                                      height:admobView.frame.height)
        
        if AdMobTest {
            admobView.adUnitID  = TestID
        }
        else{
            admobView.adUnitID  = AdMobID
        }
        
        admobView.delegate = self
        admobView.rootViewController = self
        
        let admobRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                admobRequest.testDevices = [kGADSimulatorID]
            }
            else {
                admobRequest.testDevices = [DEVICE_ID]
            }
        }
        
        admobView.load(admobRequest)
        
        self.view.addSubview(admobView)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

