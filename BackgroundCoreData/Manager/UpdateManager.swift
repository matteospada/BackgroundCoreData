//
//  UpdateManager.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//

import Foundation

class UpdateManager {
    
    static let shared = UpdateManager()
    
    private init() {}
    
    func manageKeywordUpdate() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            Task {
                let number = await StoreService.shared.getNumber()
                CoreDataManager.shared.saveNumber(number: number)
            }
        }
    }
    
}
