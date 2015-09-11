//
//  BluetoothDebug.swift
//  Remote Car
//
//  Created by wirawan sanusi on 8/12/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class BluetoothDebug: UITableViewController, CentralDelegate {

    var central: Central?
    var devices = [Device]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        central = Central()
        central?.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func stopAllConnection(sender: AnyObject) {
        
        central?.centralStopAllConnection()
    }
    
    @IBAction func scanForConnection(sender: AnyObject) {
        
        central?.centralScanForConnection()
    }
    
    func CentralDidFindDevice(central: Central, device: Device) {
    
        devices.append(device)
        tableView.reloadData()
    }
    
    func CentralGotDisconnected(central: Central) {
        
        devices = [Device]()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return devices.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UUIDCell", forIndexPath: indexPath)

        cell.textLabel?.text = devices[indexPath.row].name
        cell.detailTextLabel?.text = devices[indexPath.row].uuid.UUIDString
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
