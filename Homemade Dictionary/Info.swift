//
//  Info.swift
//  Homemade Dictionary
//
//  Created by Rohan Daruwala on 7/3/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import Foundation
import CoreData

class Info : NSManagedObject{
    
    @NSManaged var Dictionary:[String:[String]]
}
