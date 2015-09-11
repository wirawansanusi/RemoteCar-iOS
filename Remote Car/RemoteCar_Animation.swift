//
//  RemoteCar_Animation.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

// LOADING ICON ANIMATION
extension RemoteCar {
    
    func initLoadingStatusAnimation() {
        
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnim.toValue = M_PI * 2
        rotationAnim.duration = 2.0
        rotationAnim.repeatCount = HUGE
        
        loadingIcon!.layer.addAnimation(rotationAnim, forKey: "rotationAnimLayer")
    }
}

// BLUETOOTH ICON ANIMATION
extension RemoteCar {
    
    func initBluetoothStatusAnimation() {
        
        loadingIcon!.layer.removeAllAnimations()
        loadingIcon!.alpha = 0.0
        initBluetoothStatusFadeIn()
    }
    
    func initBluetoothStatusFadeIn() {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.bluetoothIcon!.alpha = 1.0
            }) { (completion: Bool) -> Void in
                self.initBluetoothStatusMoveTop()
        }
    }
    
    func initBluetoothStatusMoveTop() {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            var frame = self.bluetoothIcon!.frame
            frame.origin.y = 20
            self.bluetoothIcon!.frame = frame
            }) { (completion: Bool) -> Void in
                self.showDashboardController()
        }
    }
}

// DASHBOARD ANIMATION
extension RemoteCar {
    
    func hideDashboardController() {
        
        dashboardView.alpha = 0.0
    }
    
    func showDashboardController() {
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.dashboardView.alpha = 1.0
            }) { (completion: Bool) -> Void in
        }
    }
}
