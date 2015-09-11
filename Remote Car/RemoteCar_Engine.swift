//
//  RemoteCar_Engine.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/19/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension RemoteCar {
    
    func turnOnEngine(){
        
        let command = "a"
        let packet = command.dataUsingEncoding(NSUTF8StringEncoding)
        central?.centralWriteData(packet!)
    }
    
    func turnOffEngine(){
        
        let command = "b"
        let packet = command.dataUsingEncoding(NSUTF8StringEncoding)
        central?.centralWriteData(packet!)
    }
}
