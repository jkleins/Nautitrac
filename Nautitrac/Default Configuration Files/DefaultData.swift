//
//  DefaultData.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/23/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import Foundation
import CoreData

class defaultData {
    
    let numberOfBoatsToMake = 1
    let numberOfTripsToMake = 10
    let numberOfEntriesToMake = 10
    let numberOfWaypointsToMake = 20
    let numberOfCrewToMake = 3
    let numberOfEnginesToMake = 2
    
    var managedObjectContext: NSManagedObjectContext?
    var trip: Trip?
    var logEntry: LogEntry?
    var boat: Boat?
    var crew: Crew?
    var crewMembers: [Crew]? = []
    var waypoint: Waypoint?
    var waypoints: [Waypoint]? = []
    var engine: Engine?
    var engines: [Engine]? = []
    
    private var coreDataManager = CoreDataManager(modelName: modelNames.coreModel)

    
    init() {
        managedObjectContext = coreDataManager.managedObjectContext
        guard let managedObjectContext = managedObjectContext else {return}
        //delete current data - ask user if ever exposed
        managedObjectContext.deleteAllData()
        //create new Data
        createDefaultWaypoints(numberOfWaypoints: numberOfWaypointsToMake)
        createDefaultCrew(numberOfCrew: numberOfCrewToMake)
        createDefaultEngines(numberOfEngines: numberOfEnginesToMake)
        createDefaultBoats(boatNumber: numberOfBoatsToMake)
        do {
            try managedObjectContext.save()
        } catch  {
            print("Context could not save")
        }
    }
    
    func createDefaultBoats (boatNumber: Int) {
        guard let managedObjectContext = managedObjectContext else {return}
        
        for boatNum in 1...boatNumber {
            boat = Boat(context: managedObjectContext)
            if let boat = boat {
                boat.id = boatNum
                boat.name = "Boat number " + String(boatNum)
                //createdOn = Date() - random(20*boatnumber)
                createDefaultTrips(tripNumber: numberOfTripsToMake, entryNumber: numberOfEntriesToMake)
            }
        }
    }
    
    func createDefaultTrips (tripNumber: Int, entryNumber: Int) {
        guard let managedObjectContext = managedObjectContext else {return}
        let countOfWaypoints = waypoints?.count ?? 0
        for tripNum in 1...tripNumber {
            trip = Trip(context: managedObjectContext)
            if let trip = trip {
                trip.id = tripNum
                print(trip.uniqueId)
                trip.boat = boat
                let randomWaypoint = Int(arc4random_uniform(UInt32(countOfWaypoints)))
                let randomWaypoint2 = Int(arc4random_uniform(UInt32(countOfWaypoints)))
                waypoint = waypoints?[randomWaypoint]
                trip.fromWaypoint = waypoint
                waypoint = waypoints?[randomWaypoint2]
                trip.toWaypoint = waypoint
                //calculate fromDate (now - tripNum * 4 days)
                //calciulate toDate (fromDate + 3 days)
                //get
                createLogEntry(for: trip, numberOfEntries: entryNumber)
            }
        }
    }
    
    func createLogEntry(for trip: Trip, numberOfEntries: Int) {
        //create a log entry
        guard let managedObjectContext = managedObjectContext else {return}
        for entryNum in 1...numberOfEntries {
            logEntry = LogEntry(context: managedObjectContext)
            if let logEntry = logEntry {
                logEntry.id = entryNum
                logEntry.trip = trip
                //fill in data
                //entry.createdOn?.timeIntervalSince1970 = (trip.endDate-trip.startDate)/numberofEntries * entryNum
            }
        }
    }
    
    func createDefaultWaypoints(numberOfWaypoints: Int) {
        guard let managedObjectContext = managedObjectContext else {return}
        for waypointNum in 1...numberOfWaypoints {
            waypoint = Waypoint(context: managedObjectContext)
            if let waypoint = waypoint {
                waypoints?.append(waypoint)
                waypoint.id = waypointNum
                waypoint.name = "Waypoint " + String(waypointNum)
                //fill in data
            }
        }
    }
   
    
    func createDefaultCrew(numberOfCrew: Int) {
        guard let managedObjectContext = managedObjectContext else {return}
        for crewNum in 1...numberOfCrew {
            crew = Crew(context: managedObjectContext)
            if let crew = crew {
                crewMembers?.append(crew)
                crew.id = crewNum
                crew.name = "Crew Member " + String(crewNum)
                //fill in data
            }
        }

    }
    
    func createDefaultEngines(numberOfEngines: Int) {
        guard let managedObjectContext = managedObjectContext else {return}
        for engineNum in 1...numberOfEngines {
            engine = Engine(context: managedObjectContext)
            if let engine = engine {
                engines?.append(engine)
                engine.id = engineNum
                engine.number = engineNum % 2
                //fill in data
            }
        }

    }


}
