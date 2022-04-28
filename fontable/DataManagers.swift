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
    
    var mukbo : [NSManagedObject] = []
    var want = [Dessert]()
    
    func loadDatas() {
        
        //CoreData에서 가져오기
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContexts = appdelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Dessert> = Dessert.fetchRequest()

        //실행하고 데이터를 가져온다 (뒤에 throw가 있으면 예외 사항이 있다는것 - do catch 선언)
        do {
            self.mukbo = try manageContexts.fetch(fetchRequest)
        } catch let error as NSError {
            print("fetch Error! \(error.localizedDescription)")
        }
    }
    
    func save(brand : String, money : String, name : String) {
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //NSManagedObjectContext 설정
        let manageContexts = appdelegate.persistentContainer.viewContext
        
        //entity 설정
        let entity = NSEntityDescription.entity(forEntityName: "Dessert", in: manageContexts)!
        
        //NSManagedObject 설정
        let ate = NSManagedObject(entity: entity, insertInto: manageContexts)
        
        //관리 객체를 통한 저장
        ate.setValue(brand, forKey: "brand")
        ate.setValue(money, forKey: "money")
        ate.setValue(name, forKey: "name")
        
        //호출
        do {
            try manageContexts.save()
            self.mukbo.append(ate)
        } catch let error as NSError {
            manageContexts.rollback()
            print("--> Save fail. \(error.localizedDescription)")
        }
    }
}
