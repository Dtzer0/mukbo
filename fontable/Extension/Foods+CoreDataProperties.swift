//
//  Foods+CoreDataProperties.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/23.
//
//

import Foundation
import CoreData


extension Foods {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Foods> {
        return NSFetchRequest<Foods>(entityName: "Foods")
    }

    @NSManaged public var name: String?
    @NSManaged public var brand: String?
    @NSManaged public var money: Int16

}

extension Foods : Identifiable {

}
