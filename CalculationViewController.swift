//
//  CalculationViewController.swift
//  DilutionSolution
//
//  Created by Ryan Barrett on 5/10/16.
//  Copyright © 2016 Ryan Barrett. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    var brain:DilutionBrain!
    
    @IBOutlet weak var solute1Grams: UILabel!
    @IBOutlet weak var solute2Grams: UILabel!
    @IBOutlet weak var solventVolume: UILabel!
    @IBOutlet weak var solute1MolarMass: UILabel!
    @IBOutlet weak var solute2MolarMass: UILabel!
    @IBOutlet weak var solute1Map: UILabel!
    @IBOutlet weak var solute1Header: UILabel!
    @IBOutlet weak var solute2Header: UILabel!
    @IBOutlet weak var solute2Map: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidAppear(true)
        
        if brain == nil {
            
        }
        else{
            if brain.getSolute1Grams() >= 0 {
                solute1Grams.text = brain.getSolute1Name()+": "+brain.getSolute1Grams().description + " grams"
                solute1MolarMass.text = brain.getSolute1Name() + " Molar Mass: " + brain.getSolute1MolarMass().description + " g/mol"
            }
            else {
                solute1Grams.text = "Error: " + brain.getSolute1Name()+" not a chemical compound"
            }
            
            
            if brain.getSolute2Name() != "!" {
                if brain.getSolute2Grams() >= 0 {
                    solute2Grams.text = brain.getSolute2Name()+": "+brain.getSolute2Grams().description + " grams"
                    solute2MolarMass.text = brain.getSolute2Name() + " Molar Mass: " + brain.getSolute2MolarMass().description + " g/mol"
                }
                else {
                    solute2Grams.text = "Error: "+brain.getSolute2Name()+" not achemical compound"
                }
                
            }
            
            solventVolume.text = "in " + brain.getVolume().description + " Liters of solvent"
            
            
            
            solute1Header.text = brain.getSolute1Name()
            solute1Map.text = brain.solute1ToString()
            
            if brain.getSolute2Name() != "!" {
                solute2Header.text = brain.getSolute2Name()
                solute2Map.text = brain.solute2ToString()
            }
            
            
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueCalculationToWolfram1") {
            let svc = segue!.destinationViewController as! WolframViewController;
            
            svc.brain = brain
        }
        if (segue.identifier == "segueCalculationToMain") {
            let svc = segue!.destinationViewController as! ViewController;
            
            svc.brain = brain
        }
    }

}
