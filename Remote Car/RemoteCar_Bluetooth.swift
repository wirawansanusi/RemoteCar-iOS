//
//  RemoteCar_Bluetooth.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension RemoteCar: CentralDelegate {
 
    func initCentralRole() {
        
        central = Central()
        central?.delegate = self
    }
    
    func reInitCentralRole() {
        
        central?.centralScanForConnection()
    }
    
    func CentralDidFindDevice(central: Central, device: Device) {
        
        devices.append(device)
        initBluetoothStatusAnimation()
    }
    
    func CentralGotDisconnected(central: Central) {
        
        devices = [Device]()
        hideDashboardController()
        reInitAnimation()
        reInitCentralRole()
    }
}
