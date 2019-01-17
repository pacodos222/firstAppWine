//
//  Cata+CoreDataProperties.swift
//  firstAppWine
//
//  Created by Francisco Lardon Segovia on 15/01/2019.
//  Copyright © 2019 ual.es. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Cata {

    @NSManaged var fecha: String?
    @NSManaged var resultado: NSNumber?
    @NSManaged var cataUsuario: Usuario?
    @NSManaged var vinoCata: Vino?

}
