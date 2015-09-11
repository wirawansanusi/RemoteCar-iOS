//
//  RemoteCar_InitAnimation.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension RemoteCar {
    
    func initAnimation() {
        
        initLoadingStatus()
        initBluetoothStatus()
        initLoadingStatusAnimation()
    }
    
    func reInitAnimation() {
        
        bluetoothIcon!.removeFromSuperview()
        
        UIView.animateWithDuration(1.0) { () -> Void in
            self.loadingIcon!.alpha = 1.0
        }
        
        initBluetoothStatus()
        initLoadingStatusAnimation()
    }
}
