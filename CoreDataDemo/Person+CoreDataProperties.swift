//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Duc Dang on 7/13/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: Int64

}
