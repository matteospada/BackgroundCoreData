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
    
    func getNumber() async -> Int {
        let number = Int.random(in: 5...100)
        sleep(1)
        return number
    }
    
}
