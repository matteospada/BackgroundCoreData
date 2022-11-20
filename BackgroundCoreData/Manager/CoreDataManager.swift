//
//  CoreDataManager.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//
import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error { fatalError("Unable to initialize Core Data \(error)") }
        }
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.undoManager = nil
        
    }
}

extension CoreDataManager {
    func saveNumber(number: Int) {
        let context = self.newTaskContext()
        context.performAndWait {
            let newNumber = Number(context: context)
            newNumber.value = Int16(number)
            let error = context.saveIfChanged()
            if error != nil {
                print(error.debugDescription)
            }
        }
    }
}


extension CoreDataManager {
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        taskContext.undoManager = nil
        return taskContext
    }
}

extension NSManagedObjectContext {
  func saveIfChanged() -> NSError? {
    guard hasChanges else { return nil }
    do {
      try save()
      return nil
    } catch {
      return error as NSError
    }
  }
}
