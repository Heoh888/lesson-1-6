//
//  generatingCarNumber.swift
//  lesson-1-6
//
//  Created by MacBook on 04.01.2021.
//

import Foundation

public func generatingCarNumber() -> String {
    let alphabeticalArray = [ "а", "в", "е", "к", "м", "н", "о", "р", "с", "т", "у", "х"]
    let arrayRegions = ["77", "99", "97", "177", "199", "197", "777", "799", "797"]

   
    let generation = (seriesSymbol1: alphabeticalArray.randomElement()!, registrationNumber: Int.random(in: 100..<999), seriesSymbol2: alphabeticalArray.randomElement()!, seriesSymbol3: alphabeticalArray.randomElement()!, region: arrayRegions.randomElement()!)
    
    let number: String = generation.seriesSymbol1  + String(generation.registrationNumber) + generation.seriesSymbol2 + generation.seriesSymbol3 + generation.region
    
    return number
}
