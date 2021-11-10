//
//  SwiftUIView.swift
//  CloudKit
//
//  Created by Ryan Lintott on 2020-11-03.
//

import CoreData

struct PersistenceCloudController {
    let name: String
    let container: NSPersistentCloudKitContainer
    let moc: NSManagedObjectContext
    let backgroundMoc: NSManagedObjectContext

    var onRemoteChangeDelegate: ((_ context: NSManagedObjectContext) -> Void)? = nil {
        didSet {
            NotificationCenter.default.removeObserver(self, name: .NSPersistentStoreRemoteChange, object: nil)
        }
    }

    init(name: String, inMemory: Bool = false) {
        self.name = name
        container = NSPersistentCloudKitContainer(name: name)
        guard let description = container.persistentStoreDescriptions.first else {
            // Apple didn't use this guard so it will likely never error
            fatalError("No Descriptions found")
        }
        if inMemory {
            description.url = URL(fileURLWithPath: "/dev/null")
        }
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        moc = container.viewContext
        moc.automaticallyMergesChangesFromParent = true
        moc.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy

        backgroundMoc = container.newBackgroundContext()
        backgroundMoc.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        
        NotificationCenter.default.addObserver(forName: .NSPersistentStoreRemoteChange, object: nil, queue: queue, using: onRemoteChange)
        
//        let center = NotificationCenter.default
//        let notification = UIApplication.willResignActiveNotification
//
//        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
//            guard let self = self else { return }
//
//            if self.container.viewContext.hasChanges {
//                try? self.container.viewContext.save()
//            }
//        }
    }
    
    var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    func onRemoteChange(_ notification: Notification) {
        if let onRemoteChangeDelegate = onRemoteChangeDelegate {
            let context = backgroundMoc
            context.performAndSave(onRemoteChangeDelegate)
        }
    }
}

extension PersistenceCloudController {
    static var previewDebug: PersistenceCloudController {
        PersistenceCloudController(name: "Favourites", inMemory: true)
    }
    
    static func preview(name: String, previewData: ((NSManagedObjectContext) -> Void)? = nil) -> PersistenceCloudController {
        let result = PersistenceCloudController(name: name, inMemory: true)
        let viewContext = result.container.viewContext

        // add items to moc here
        previewData?(viewContext)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }
}
