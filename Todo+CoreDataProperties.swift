//
//  Todo+CoreDataProperties.swift
//  Todo App
//
//  Created by 박혜성(Hyesung Park) on 12/28/23.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var priority: String?

}

extension Todo : Identifiable {

}
