//
//  ViewController.swift
//  DilutionSolution
//
//  Created by Ryan Barrett on 4/26/16.
//  Copyright © 2016 Ryan Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var soluteOneName: UITextField!


    @IBOutlet weak var SoluteTwoName: UITextField!
    
    
    @IBOutlet weak var soluteOneConcentration: UITextField!
    

    @IBOutlet weak var soluteTwoConcentration: UITextField!
    
    
    @IBOutlet weak var solutionVolume: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
    }
    
    var brain: DilutionBrain?
    
    func initializeTextFields() {
        soluteOneConcentration.keyboardType = UIKeyboardType.NumberPad
        soluteTwoConcentration.keyboardType = UIKeyboardType.NumberPad
        solutionVolume.keyboardType = UIKeyboardType.NumberPad
    }
    
    @IBAction func go(sender: AnyObject) {
        let solute1Name = soluteOneName.text!
        
        var solute2Name = "!"
        if SoluteTwoName.text != "" {
            solute2Name = SoluteTwoName.text!
        }
        
        var solute1Concentration = -1.0
        if soluteOneConcentration.text != "" {
            solute1Concentration = Double(soluteOneConcentration.text!)!
        }
        
        var solute2Concentration = -1.0
        if soluteTwoConcentration.text != "" {
            solute2Concentration = Double(soluteTwoConcentration.text!)!
        }
        
        var volume = -1.0
        if solutionVolume.text != "" {
            volume = Double(solutionVolume.text!)!
        }
        
        if solute1Name == "" || solute1Concentration == -1.0 || volume == -1.0 {
            let alertController = UIAlertController(title: "Error!", message:
                "Please enter the required fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            brain = DilutionBrain(theSolute1Name: solute1Name, theSolute2Name: solute2Name, theSolute1Conc: solute1Concentration, theSolute2Conc: solute2Concentration, theVolume: volume)
            
            brain!.go()
        }
        
        
        
    }
    
    func getBrain() -> DilutionBrain? {
        return brain
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueMainToCalculation") {
            let svc = segue!.destinationViewController as! CalculationViewController;
            
            svc.brain = brain
            
        }
    }
    
}

