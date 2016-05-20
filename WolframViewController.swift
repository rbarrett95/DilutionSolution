//
//  WolframViewController.swift
//  DilutionSolution
//
//  Created by Ryan Barrett on 5/10/16.
//  Copyright © 2016 Ryan Barrett. All rights reserved.
//

import UIKit

class WolframViewController: UIViewController{
    
    var brain:DilutionBrain!
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if brain != nil {
            let url = NSURL (string: "https://www.wolframalpha.com/input/?i="+brain.getSolute1Name());
            let requestObj = NSURLRequest(URL: url!);
            webView.loadRequest(requestObj);
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueWolfram1ToCalculation") {
            let svc = segue!.destinationViewController as! CalculationViewController;
            svc.brain = brain
            
        }
        if (segue.identifier == "segueWolfram1ToWolfram2") {
            let svc = segue!.destinationViewController as! Wolfram2ViewController;
            svc.brain = brain
            
        }
    }
    
   
}
