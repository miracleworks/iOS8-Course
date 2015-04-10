//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by SHITAL DESAI on 4/9/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import Foundation


class SlotBrain
{
    class func unpackSlotsIntoSlotRows(slots:[[Slot]]) -> [[Slot]]
    {
        var slotRow:[Slot] = []
        var slotRow2:[Slot] = []
        var slotRow3:[Slot] = []
        
        for slotArray in slots
        {
            for var index = 0; index < slotArray.count; index++
            {
                let slot = slotArray[index]
                
                if index == 0
                {
                    slotRow.append(slot)
                    
                }
                else if index == 1
                {
                    slotRow2.append(slot)
                }
                else if index == 2
                {
                    slotRow3.append(slot)
                }
                else
                {
                    println("Error")
                }
            }
        }
        
        var slotsInRows:[[Slot]] = [slotRow,slotRow2,slotRow3]
        return slotsInRows
    }
    
    
    class func computeWinnings(slots: [[Slot]]) -> Int
    {
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0 // all same color
        var threeOfAKindWinCount = 0 // all of same kind
        var straightWinCount = 0 // sequence
        
        for slotRow in slotsInRows
        {
            if checkFlush(slotRow) == true
            {
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) == true
            {
                winnings += 1
                straightWinCount += 1
            }
            
            if checkThreeOfAKind(slotRow)
            {
                winnings += 1
                threeOfAKindWinCount += 1
            }
            
        }
        
        if flushWinCount == 3
        {
            println("Royal Flush")
            winnings += 15
        }
        
        if straightWinCount == 3
        {
            println("Epic Straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3
        {
            println("Threes all around")
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush(slotRow:[Slot]) -> Bool
    {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true
        {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false  && slot3.isRed == false
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    class func checkThreeInARow(slotRow:[Slot]) -> Bool
    {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2
        {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    class func checkThreeOfAKind(slotRow:[Slot]) -> Bool
    {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
    
    
}