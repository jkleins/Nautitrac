//
//  Trip.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/22/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//
import Foundation

extension Trip {
    
    var updatedAtAsDate: Date {
        return updatedOn ?? Date()
    }
    
    var createdAtAsDate: Date {
        return createdOn ?? Date()
    }
}
