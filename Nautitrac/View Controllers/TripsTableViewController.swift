//
//  TripsTableViewController.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/22/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import UIKit
import CoreData

class TripsTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    private lazy var fetchedResultsController: NSFetchedResultsController<Trip> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Trip.toDate), ascending: false)]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: self.coreDataManager.managedObjectContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()

    private var coreDataManager = CoreDataManager(modelName: "Trips")

    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions
    @IBAction func AddTrip(_ sender: Any) {
    }

    func updateView() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell", for: indexPath) as! TripsTableViewCell

        // Configure the cell...
        cell.tripTitle.text = "Trip Title"
        cell.tripDate.text = "Trip Dates - Trip Dates"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == storyboardIDs.tripDetailSegue {
            if let newDetailVC = (segue.destination as! UINavigationController).topViewController as? TripViewController {
                newDetailVC.textToPutInTitleLabel = "New Trip Entry"
            }
        }
        if segue.identifier == storyboardIDs.logEntryTableSegue {
            if let newDetailVC = segue.destination as? LogEntryTableViewController {
                newDetailVC.title = "Log Entries"
                newDetailVC.sampleTitleNumber = self.tableView.indexPathForSelectedRow!.row
            }
        }
        
    }
}

extension TripsTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        updateView()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath, let cell = tableView(tableView, cellForRowAt: indexPath) as? TripsTableViewCell {
                configure(cell, at: indexPath)
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)            }
        }
    }
    
    private func configure(_ cell: TripsTableViewCell,at indexPath: IndexPath) {
        let trip = fetchedResultsController.object(at: indexPath)
        
//        cell.titleLabel.text = note.title
//        cell.contentsLabel.text = note.contents
//        cell.updatedAtLabel.text = updatedAtDateFormatter.string(from: note.updatedAtAsDate)
    }
    
}
