//
//  RemoteCar_LED.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/19/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension RemoteCar {
    
    func turnOnLED(){
        
        let command = "t"
        let packet = command.dataUsingEncoding(NSUTF8StringEncoding)
        central?.centralWriteData(packet!)
    }
    
    func turnOffLED(){
        
        let command = "o"
        let packet = command.dataUsingEncoding(NSUTF8StringEncoding)
        central?.centralWriteData(packet!)
    }
}
