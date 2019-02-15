//
//  ExerciseCoach.swift
//  TheArithmeticAPP
//
//  Created by student on 2/14/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
struct ExerciseCoach{
    
    static func energyConsumed(during: String, weight: Double, time: Int) -> Double
    {
        let sports : [String : Double] = ["Bicycling" :8.0, "Jumping Rope": 12.3, "Running - slow": 9.8, "Running - fast": 23.0, "Tennis": 8.0, "Swimming": 5.8 ]
        let met = sports[during]!
        let energy = met * 3.5 * weight/2.2/200 * Double(time)
        return energy
    }
    
    static func timeToLose1Pound(during: String, weight: Double) -> Double
    {
        let sports : [String : Double] = ["Bicycling" :8.0, "Jumping Rope": 12.3, "Running - slow": 9.8, "Running - fast": 23.0, "Tennis": 8.0, "Swimming": 5.8 ]
        let met = sports[during]
        let timetoloose = 3500 / (met! * 3.5 * weight/2.2/200)
        return timetoloose
        
        
    }
}
