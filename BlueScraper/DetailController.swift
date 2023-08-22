//
//  DetailController.swift
//  BlueScraper
//
//  Created by Sebastian Kazakov on 8/19/23.
//

import Foundation
import UIKit
import CoreBluetooth


class DetailController: UIViewController {
    
    @IBOutlet weak var PeripheralName: UILabel!
    @IBOutlet weak var ServiceName: UILabel!
    @IBOutlet weak var CharacteristicName: UILabel!
    @IBOutlet weak var DescriptorName: UILabel!
    @IBOutlet weak var RSSI: UILabel!
    @IBOutlet weak var UUIDName: UILabel!
    
    var rssiTimer = Timer()
    var NilString = "nil"
    var uuidString = ""
    var ServiceNameString = ""
    var CharacteristicNameString = ""
    var DescriptorNameString = ""
    
    override func viewDidLoad() {
        print("welcome to details")
        
        PeripheralName.text = "\(ConnectedCurrentPeripheral.name ?? NilString)"
        
        for service in currentConnectedServices{
            print("service found!")
            ServiceNameString += service.debugDescription
        }
        
        ServiceName.text = "\(ServiceNameString)"
        
        
        for characteristic in currentConnectedCharacteristcs{
            print("characteristic found!")
            CharacteristicNameString += characteristic.debugDescription
        }
        CharacteristicName.text = "\(CharacteristicNameString)"
        
        
        for descriptor in currentConnectedDescriptors{
            DescriptorNameString += descriptor.description
        }
        
        DescriptorName.text = "\(DescriptorNameString)"
        
        uuidString = UUIDString
        UUIDName.text = "UUID: \(uuidString)"
        
        rssiTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(refreshRSSI), userInfo: nil, repeats: true)
    }
    
    @objc func refreshRSSI(){
        let rssiPercent = 100 - globalRSSI
        RSSI.text = "RSSI: \(rssiPercent)%"
    }
    
}
