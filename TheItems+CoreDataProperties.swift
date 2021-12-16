//
//  TheItems+CoreDataProperties.swift
//  Bucket List
//
//  Created by لمياء فالح الدوسري on 12/05/1443 AH.
//
//

import Foundation
import CoreData


extension TheItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TheItems> {
        return NSFetchRequest<TheItems>(entityName: "TheItems")
    }

    @NSManaged public var text: String?

}

extension TheItems : Identifiable {

}
