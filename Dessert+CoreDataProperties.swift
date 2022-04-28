//
//  Dessert+CoreDataProperties.swift
//  fontable
//
//  Created by 홍태희 on 2022/04/19.
//
//

import Foundation
import CoreData


extension Dessert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dessert> {
        return NSFetchRequest<Dessert>(entityName: "Dessert")
    }

    @NSManaged public var brand: String?
    @NSManaged public var money: String?
    @NSManaged public var name: String?

}

extension Dessert : Identifiable {

}
