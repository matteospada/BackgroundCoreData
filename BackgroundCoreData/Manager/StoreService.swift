//
//  StoreService.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//

import Foundation

class StoreService {
    
    static let shared = StoreService()
    
    init() {}
    
    func newNumber() async {
        let number = Int.random(in: 5...100)
        sleep(1)
        // Qui aggironerei le keyword 
        CoreDataManager.shared.saveNumber(number: number)
    }
    
}
