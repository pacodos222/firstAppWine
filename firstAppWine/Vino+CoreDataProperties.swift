//
//  Vino+CoreDataProperties.swift
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

extension Vino {

    @NSManaged var alcalinityOfAsh: NSNumber?
    @NSManaged var alcohol: NSNumber?
    @NSManaged var ash: NSNumber?
    @NSManaged var claseEstimada: String?
    @NSManaged var claseReal: String?
    @NSManaged var colorIntensitiy: NSNumber?
    @NSManaged var flavonoids: NSNumber?
    @NSManaged var hue: NSNumber?
    @NSManaged var nonFlavonoidsPhenols: NSNumber?
    @NSManaged var od280: NSNumber?
    @NSManaged var proanthocyanins: NSNumber?
    @NSManaged var proline: NSNumber?

}
