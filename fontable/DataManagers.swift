//
//  DataManagers.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/24.
//

import UIKit
import CoreData

class DataManagers {
    
    static let shared = DataManagers()
    
    private init() {
        
    }
        
    //context 객체 사용
    var manageContexts : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var want = [Dessert]()
    
    func loadDatas() {
        
        //CoreData에서 가져오기
        let fetchRequest : NSFetchRequest<Dessert> = Dessert.fetchRequest()

        //실행하고 데이터를 가져온다 (뒤에 throw가 있으면 예외 사항이 있다는것 - do catch 선언)
        do {
            self.want = try manageContexts.fetch(fetchRequest)
        } catch let error as NSError {
            print("fetch Error! \(error.localizedDescription)")
        }
    }
    
    func save(_ requests : String?) {

        let half = Dessert(context: manageContexts)

        half.brand = requests
        half.money = requests
        half.name = requests

        want.insert(half, at: 0)

        saveContext()
    }
    
    //옵셔널로 선언했지만 실제로 메모가 전달된 경우에만 삭제
    func delete(_ requests : Dessert?) {
        
        if let requests = requests {
            manageContexts.delete(requests)
            saveContext()
        }
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
