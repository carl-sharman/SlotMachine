//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Carl Sharman Work on 16/01/2015.
//  Copyright (c) 2015 United Learning. All rights reserved.
//

import Foundation

class SlotBrain {
    class func unpackSlotIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                } else if index == 1 {
                    slotRow2.append(slot)
                } else if index == 2 {
                    slotRow3.append(slot)
                } else {
                    println("Error")
                }
            }
        }
        var slotsInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        
        return slotsInRows;
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        var slotsInRows = SlotBrain.unpackSlotIntoSlotRows(slots)
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if SlotBrain.checkFlush(slotRow) {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if SlotBrain.checkThreeInARow(slotRow) {
                println("three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            if SlotBrain.checkThreeOfAKind(slotRow) {
                println("three of a kind")
                winnings += 3
                threeOfAKindWinCount += 1
            }
        }
        
        if flushWinCount == 3 {
            println("Royal flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3 {
            println("Threes all around")
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed && slot2.isRed && slot3.isRed {
            return true;
        } else if !slot1.isRed && !slot2.isRed && !slot3.isRed {
            return true;
        } else {
            return false;
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true;
        } else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true;
        } else {
            return false;
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        } else {
            return false
        }
    }
}