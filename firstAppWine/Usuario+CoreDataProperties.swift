//
//  Usuario+CoreDataProperties.swift
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

extension Usuario {

    @NSManaged var imagen: NSData?
    @NSManaged var password: String?
    @NSManaged var username: String?
    @NSManaged var usuarioCata: NSSet?

}
