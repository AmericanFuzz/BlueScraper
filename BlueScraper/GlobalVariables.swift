//
//  GlobalVariables.swift
//  BlueScraper
//
//  Created by Sebastian Kazakov on 8/19/23.
//

import Foundation
import UIKit

let weakHit = UIImpactFeedbackGenerator(style: .light)
let mediumHit = UIImpactFeedbackGenerator(style: .medium)
let hardHit = UIImpactFeedbackGenerator(style: .heavy)
let rigidHit = UIImpactFeedbackGenerator(style: .rigid)
let softHit = UIImpactFeedbackGenerator(style: .light)

final class HapticsManager{
    
    static let shared = HapticsManager()
    
    public func selectVibration(){
        DispatchQueue.main.async {
            let feedback = UISelectionFeedbackGenerator()
            feedback.prepare()
            feedback.selectionChanged()
        }
    }
    
    public func beginVibration(type: UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let notification = UINotificationFeedbackGenerator()
            notification.prepare()
            notification.notificationOccurred(type)
        }
    }
}
    
    

