//
//  Central.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import CoreBluetooth

protocol CentralDelegate {
    
    func CentralDidFindDevice(central: Central, device: Device)
    func CentralGotDisconnected(central: Central)
}

class Central: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var manager: CBCentralManager?
    var peripheral: CBPeripheral?
    var characteristics = [String : CBCharacteristic]()
    var delegate: CentralDelegate?
    
    let RBL_SERVICE_UUID = "713D0000-503E-4C75-BA94-3148F18D941E" // use it to connected
    let RBL_CHAR_TX_UUID = "713D0002-503E-4C75-BA94-3148F18D941E" // use it for read value
    let RBL_CHAR_RX_UUID = "713D0003-503E-4C75-BA94-3148F18D941E" // use it for write value
    
    var device: Device?
    
    override init() {
        
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }
    
    func centralStopAllConnection() {
        
        manager!.cancelPeripheralConnection(peripheral!)
    }
    
    func centralScanForConnection() {
        
        let cbuuid = CBUUID(string: RBL_SERVICE_UUID)
        manager!.scanForPeripheralsWithServices([cbuuid], options: nil)
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
        centralScanForConnection()
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
        for (key,value) in advertisementData {
            
            if key == "kCBAdvDataIsConnectable" && value as! Bool == true {
                
                let deviceName = advertisementData["kCBAdvDataLocalName"] as! String
                let deviceUUIDs = advertisementData["kCBAdvDataServiceUUIDs"] as! NSArray
                let deviceUUID = deviceUUIDs.firstObject as! CBUUID
                device = Device(name: deviceName, uuid: deviceUUID)
                
                self.peripheral = peripheral
                manager!.connectPeripheral(self.peripheral!, options: nil)
                manager!.stopScan()
            }
        }
    }
    
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        
        delegate?.CentralGotDisconnected(self)
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        
        delegate?.CentralDidFindDevice(self, device: device!)
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        
        for service in peripheral.services! {
            peripheral.discoverCharacteristics(nil, forService: service)
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        
        for characteristic in service.characteristics! {
            characteristics[characteristic.UUID.UUIDString] = characteristic
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        
        print("value: \(characteristic.value) | desc: \(characteristic.descriptors)")
    }
    
}

extension Central {
    
    func centralWriteData(data: NSData) {
        
        peripheral?.writeValue(data, forCharacteristic: characteristics[RBL_CHAR_RX_UUID]!, type: .WithoutResponse)
    }
}

