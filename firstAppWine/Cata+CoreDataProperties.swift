//
//  Cata+CoreDataProperties.swift
//  firstAppWine
//
//  Created by Aula11 on 17/12/18.
//  Copyright © 2018 ual.es. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Cata {

    @NSManaged var fecha: String?
    @NSManaged var resultado: NSNumber?
    @NSManaged var vinoCata: NSManagedObject?

}
