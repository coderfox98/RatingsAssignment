//
//  Rating+CoreDataProperties.swift
//  RatingsAssignment
//
//  Created by Rishabh Raj on 20/05/20.
//  Copyright © 2020 Rishabh Raj. All rights reserved.
//
//

import Foundation
import CoreData


extension Rating {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rating> {
        return NSFetchRequest<Rating>(entityName: "Rating")
    }
    @NSManaged public var id: UUID?
    @NSManaged public var rating: String?
    @NSManaged public var date: Date?

}
extension Rating : Identifiable {
    
}
