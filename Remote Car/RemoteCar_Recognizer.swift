//
//  RemoteCar_Recognizer.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit


extension RemoteCar {
    
    func initRecognizer() {
        
        initItemSlot1()
        initItemSlot2()
    }
    
    func initItemSlot1() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("toggleItemSlot1:"))
        recognizer.numberOfTapsRequired = 1
        
        itemSlot1.tag = 0
        itemSlot1.userInteractionEnabled = true
        itemSlot1.addGestureRecognizer(recognizer)
    }
    
    func toggleItemSlot1(recognizer: UITapGestureRecognizer) {
        
        switch itemSlot1.tag {
        case 0:
            itemSlot1.highlighted = true
            itemSlot1.tag = 1
            turnOnLED()
            break
        case 1:
            itemSlot1.highlighted = false
            itemSlot1.tag = 0
            turnOffLED()
            break
        default:
            break
        }
    }
    
    func initItemSlot2() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("toggleItemSlot2:"))
        recognizer.numberOfTapsRequired = 1
        
        itemSlot2.tag = 0
        itemSlot2.userInteractionEnabled = true
        itemSlot2.addGestureRecognizer(recognizer)
    }
    
    func toggleItemSlot2(recognizer: UITapGestureRecognizer) {
        
        switch itemSlot2.tag {
        case 0:
            itemSlot2.highlighted = true
            itemSlot2.tag = 1
            turnOnEngine()
            break
        case 1:
            itemSlot2.highlighted = false
            itemSlot2.tag = 0
            turnOffEngine()
            break
        default:
            break
        }
    }
}
