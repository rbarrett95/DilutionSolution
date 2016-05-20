//
//  DilutionBrain.swift
//  DilutionSolution
//
//  Created by Ryan Barrett on 5/3/16.
//  Copyright © 2016 Ryan Barrett. All rights reserved.
//

import Foundation

class DilutionBrain {
    
    private var solute1name = String()
    private var solute2name = String()
    private var solute1conc = Double()
    private var solute2conc = Double()
    private var volume = Double()
    
    private var solute1MolarMass = Double()
    private var solute2MolarMass = Double()
    
    private var solute1Grams = Double()
    private var solute2Grams = Double()
    
    private var solute1Dict = [String: String]()
    private var solute2Dict = [String: String]()
    
    init(theSolute1Name:String, theSolute2Name:String, theSolute1Conc:Double, theSolute2Conc:Double, theVolume:Double) {
        solute1name = theSolute1Name
        solute2name = theSolute2Name
        solute1conc = theSolute1Conc
        solute2conc = theSolute2Conc
        volume = theVolume
    }
    
    func go() {
        
        solute1MolarMass = getMolarMass(solute1name)
        
        if solute2name != "!" {
            solute2MolarMass = getMolarMass(solute2name)
        }
        
        
        self.calculate()
        
        setDensity(solute1name)
        setOdor(solute1name)
        setAppearance(solute1name)
        
    }
    
    func solute1ToString() -> String {
        var result = String()
        
        for(key, value) in solute1Dict {
            result += key + ": " + value + "\n"
        }
        
        return result
    }
    
    func solute2ToString() -> String {
        var result = String()
        
        for(key, value) in solute2Dict {
            result += key + ": " + value + "\n"
        }
        
        return result
    }
    
    //takes a search query, scrapes wikipedia for molar mass, and return molar mass as a double
    private func getMolarMass(query: String) -> Double {
        var mass = String()
        
        let myURLString = "https://en.wikipedia.org/wiki/" + query
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return -1.0
        }
        
        do {
            let myHTMLString = try String(contentsOfURL: myURL)
            
            if myHTMLString.lowercaseString.rangeOfString("molar mass") != nil {
                let index = myHTMLString.lowercaseString.rangeOfString("molar mass")!
                let rangeArray = Array(index)
                var i = myHTMLString.startIndex.distanceTo(rangeArray[0])
                i += 36
                
                
                var char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                
                while("0"..."9" ~= char || char == "."){
                    mass.append(myHTMLString[myHTMLString.startIndex.advancedBy(i)])
                    i += 1
                    char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                }
            }
            else {
                return -1.0
            }
            
            
            
        } catch let error as NSError {
            print("Error: \(error)")
            return -1.0
        }
        
        return Double(mass)!
    }
    
    
    //scrape density
    private func setDensity(query: String) -> Double{
        var density = String()
        
        let myURLString = "https://en.wikipedia.org/wiki/" + query
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return -1.0
        }
        
        do {
            let myHTMLString = try String(contentsOfURL: myURL)
            
            if myHTMLString.lowercaseString.rangeOfString("density") != nil {
                let index = myHTMLString.lowercaseString.rangeOfString("density")!
                let rangeArray = Array(index)
                var i = myHTMLString.startIndex.distanceTo(rangeArray[0])
                i += 46
                
                
                var char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                
                while(char != "<"){
                    density.append(myHTMLString[myHTMLString.startIndex.advancedBy(i)])
                    i += 1
                    char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                }
            }
            else {
                return -1.0
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
            return -1.0
        }
        
        if query == solute1name {
            solute1Dict["density"] = density
        }
        if query == solute2name {
            solute2Dict["density"] = density
        }
        return 0
    }
    
    //scrape odor point
    private func setOdor(query: String) -> Double{
        var odor = String()
        
        let myURLString = "https://en.wikipedia.org/wiki/" + query
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return -1.0
        }
        
        do {
            let myHTMLString = try String(contentsOfURL: myURL)
            
            if myHTMLString.lowercaseString.rangeOfString("odor") != nil {
                let index = myHTMLString.lowercaseString.rangeOfString("odor")!
                let rangeArray = Array(index)
                var i = myHTMLString.startIndex.distanceTo(rangeArray[0])
                i += 37
                
                
                var char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                
                while(char != "<"){
                    odor.append(myHTMLString[myHTMLString.startIndex.advancedBy(i)])
                    i += 1
                    char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                }
            }
            else {
                return -1.0
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
            return -1.0
        }
        
        if query == solute1name {
            solute1Dict["odor"] = odor
        }
        if query == solute2name {
            solute2Dict["odor"] = odor
        }
        
        return 0
    }
    
    //scrape odor point
    private func setAppearance(query: String) -> Double{
        var appear = String()
        
        let myURLString = "https://en.wikipedia.org/wiki/" + query
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return -1.0
        }
        
        do {
            let myHTMLString = try String(contentsOfURL: myURL)
            
            if myHTMLString.lowercaseString.rangeOfString("appearance") != nil {
                let index = myHTMLString.lowercaseString.rangeOfString("appearance")!
                let rangeArray = Array(index)
                var i = myHTMLString.startIndex.distanceTo(rangeArray[0])
                i += 20
                
                
                var char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                
                while(char != "<"){
                    appear.append(myHTMLString[myHTMLString.startIndex.advancedBy(i)])
                    i += 1
                    char = myHTMLString[myHTMLString.startIndex.advancedBy(i)]
                }
            }
            else {
                return -1.0
            }
            
            
        } catch let error as NSError {
            print("Error: \(error)")
            return -1.0
        }
        
        if query == solute1name {
            solute1Dict["appearance"] = appear
        }
        if query == solute2name {
            solute2Dict["appearance"] = appear
        }
        
        return 0
    }
    
    
    
    //set the number of grams for each solute
    private func calculate() {
        let solute1NumMoles = solute1conc * volume
        solute1Grams = solute1NumMoles * solute1MolarMass
        
        if solute2name != "!"{
            let solute2NumMoles = solute2conc * volume
            solute2Grams = solute2NumMoles * solute2MolarMass
        }
        else {
            solute2Grams = -1
        }
    }
    
    func getSolute1Name() -> String {
        return solute1name
    }
    
    func getSolute2Name() -> String {
        return solute2name
    }
    
    func getSolute1Grams() -> Double {
        return solute1Grams
    }
    
    func getSolute2Grams() -> Double {
        return solute2Grams
    }
    
    func getSolute1MolarMass() -> Double {
        return solute1MolarMass
    }
    
    func getSolute2MolarMass() -> Double {
        return solute2MolarMass
    }
    
    func getVolume() -> Double {
        return volume
    }
    
}