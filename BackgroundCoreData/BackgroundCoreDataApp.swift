//
//  BackgroundCoreDataApp.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Eseguo codice in background")
        UpdateManager.shared.manageKeywordUpdate()
    }
}

@main
struct BackgroundCoreDataApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
