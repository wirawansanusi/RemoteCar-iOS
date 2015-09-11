//
//  RemoteCar_Icon.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension RemoteCar {
    
    func initLoadingStatus() {
        
        let imageSize = CGSize(width: 100.0, height: 100.0)
        let centerPoint = view.center
        loadingIcon = UIImageView(
            frame: CGRect(
                origin: CGPoint(
                    x: centerPoint.x - imageSize.width / 2,
                    y: centerPoint.y - imageSize.height / 2),
                size: imageSize
            )
        )
        loadingIcon!.image = UIImage(named: "Loading")
        view.addSubview(loadingIcon!)
    }
    
    func initBluetoothStatus() {
        
        let imageSize = CGSize(width: 25.0, height: 25.0)
        let centerPoint = view.center
        bluetoothIcon = UIImageView(
            frame: CGRect(
                origin: CGPoint(
                    x: centerPoint.x - imageSize.width / 2,
                    y: centerPoint.y - imageSize.height / 2),
                size: imageSize
            )
        )
        bluetoothIcon!.image = UIImage(named: "Bluetooth")
        bluetoothIcon!.alpha = 0.0
        view.addSubview(bluetoothIcon!)
    }
}