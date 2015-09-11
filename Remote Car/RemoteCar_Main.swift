//
//  RemoteCar_Main.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/18/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class RemoteCar: UIViewController {
    
    var loadingIcon: UIImageView?
    var bluetoothIcon: UIImageView?
    
    var central: Central?
    var devices = [Device]()
    
    @IBOutlet weak var dashboardView: UIView!
    @IBOutlet weak var itemSlot1: UIImageView!
    @IBOutlet weak var itemSlot2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideDashboardController()
        initRecognizer()
        remoteCarScanAvailableConnection()
    }

    func remoteCarScanAvailableConnection() {
        
        initAnimation()
        initCentralRole()
    }
}
