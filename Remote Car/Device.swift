//
//  Device.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/16/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import CoreBluetooth

class Device {
    
    var name: String
    var uuid: CBUUID
    
    init(name: String, uuid: CBUUID) {
        self.name = name
        self.uuid = uuid
    }
}
