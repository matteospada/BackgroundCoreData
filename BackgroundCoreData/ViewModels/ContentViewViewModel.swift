//
//  ContentViewViewModel.swift
//  BackgroundCoreData
//
//  Created by Matteo Spada on 20/11/22.
//

import Foundation
import SwiftUI

class ContentViewViewModel: NSObject, ObservableObject {
    
    @Published var values: [Int] = [Int]()
    private let fectchedResultController: NSFetchedResultsController<Number>
    
    override init() {
        // Configuro il view model come delegate di NSFetchedResultsController
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Number> = Number.fetchRequest()
        fetchRequest.sortDescriptors = []
        fectchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fectchedResultController.delegate = self
        // Retrieve app Data from the database
        fetchAll()
    }
    
    private func fetchAll() {
        // Fetch coredata items and create the viewModel array.
        do {
            try fectchedResultController.performFetch()
            guard let objects = fectchedResultController.fetchedObjects else { return }
            self.values = objects.map { Int($0.value) }
            
        } catch {
            print(error)
        }
    }
}


extension ContentViewViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Ricevo gli aggironamenti del context e di conseguenza aggiorno il view Model.
        print("Inside controllerDidChangeContent")
        guard let objects = controller.fetchedObjects as? [Number] else { return }
        self.values = objects.map { Int($0.value) }
    }
}
