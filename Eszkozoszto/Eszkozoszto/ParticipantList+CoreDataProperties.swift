//
//  ParticipantList+CoreDataProperties.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 08/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ParticipantList {

    @NSManaged var listName: String?
    @NSManaged var participants: NSSet?

}
