//
//  NSManagedObjectContext-extension.swift
//  Wordhord
//
//  Created by Ryan Lintott on 2020-08-21.
//

import CoreData

extension NSManagedObjectContext {
    func performAndSave(_ block: @escaping (_ context: NSManagedObjectContext) -> Void) {
        self.performAndWait {
            block(self)
            
            if self.hasChanges {
                do {
                    try self.save()
                } catch {
                    print("Error saving to context: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func deleteAllData(_ entityName: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let results = (try? fetch(request) as? [NSManagedObject])?.compactMap( { $0 } ) ?? []
        results.forEach(delete)
    }
    
    func deleteAllData(_ entityNames: [String]) {
        entityNames.forEach(deleteAllData)
    }
}
