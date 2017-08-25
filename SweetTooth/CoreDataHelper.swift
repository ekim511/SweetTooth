//
//  CoreDataHelper.swift
//  SweetTooth
//
//  Created by Eliott Kim on 8/25/17.
//  Copyright © 2017 Eliott Kim. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    //Create new note in Core Data
    static func newIceCreamStore() -> SavedIceCreamStore {
        let iceCreamStore = NSEntityDescription.insertNewObject(forEntityName: "SavedIceCreamStore", into: managedContext) as! SavedIceCreamStore
        return iceCreamStore
    }
    
    //Save to Core Data
    static func saveIceCreamStore() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    //Delete from Core Data
    static func delete(iceCreamStore: SavedIceCreamStore) {
        managedContext.delete(iceCreamStore)
        saveIceCreamStore()
    }
    //Retreive from Core Data
    static func retrieveIceCreamStores() -> [SavedIceCreamStore] {
        let fetchRequest = NSFetchRequest<SavedIceCreamStore>(entityName: "SavedIceCreamStore")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}
