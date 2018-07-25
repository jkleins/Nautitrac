//
//  Boat.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/23/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import Foundation

extension Boat {
    
    var updatedAtAsDate: Date {
        return updatedOn ?? Date()
    }
    
    var createdAtAsDate: Date {
        return createdOn ?? Date()
    }
    
    var id: Int {
        get {
            return Int(uniqueId)
        }
        set {
            uniqueId = Int32(newValue)
        }
    }
}
