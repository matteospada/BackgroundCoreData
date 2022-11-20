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
            //Controlla se tutte le keyword sono aggiornate se false aggiornale
            Task {
                await StoreService.shared.newNumber()
            }
        }
    }
    
}
