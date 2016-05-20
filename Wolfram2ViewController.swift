//
//  Wolfram2ViewController.swift
//  DilutionSolution
//
//  Created by Ryan Barrett on 5/10/16.
//  Copyright © 2016 Ryan Barrett. All rights reserved.
//

import UIKit

class Wolfram2ViewController: UIViewController {

    var brain:DilutionBrain!
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL (string: "https://www.wolframalpha.com/input/?i="+brain.getSolute2Name());
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueWolfram2ToWolfram1") {
            let svc = segue!.destinationViewController as! WolframViewController;
            svc.brain = brain
            
        }
    }

}
