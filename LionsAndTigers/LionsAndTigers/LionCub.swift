//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by SHITAL DESAI on 4/2/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import Foundation

class LionCub: Lion
{
    // This sub-class can access super-class Lion class properties and functions
    
    func rubLionCubsBelly()
    {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar()
    {
        super.roar()
        
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String
    {
        var randomFact:String
        if self.isAlphaMale
        {
            randomFact = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else
        {
            randomFact = "Cubs begin eating meat at about the age of six weeks."
        }
        
        return randomFact
    }
}