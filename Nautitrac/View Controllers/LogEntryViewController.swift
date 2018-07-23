//
//  LogEntryViewController.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/22/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import UIKit

class LogEntryViewController: UIViewController {
    
    var logEntry: LogEntry?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    //MARTK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        save()

      }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    @IBAction func saveButton(_ sender: Any) {
        save()
    }
    
    private func save() {
        guard let logEntry = logEntry else { return }
        let dateFormatter = DateFormatter()
        logEntry.dateOfEntry = dateFormatter.date(from: dateTextField.text!) ?? Date()
        logEntry.latitude = Float(latitudeTextField.text!) ?? 0.0
        logEntry.longitude = Float(longitudeTextField.text!) ?? 0.0
        logEntry.course = Float(courseTextField.text!) ?? 0.0
        logEntry.speed = Float(speedTextField.text!) ?? 0.0

    }
    func setupView() {
        dateTextField.text = logEntry?.dateOfEntry?.description
        latitudeTextField.text = String(logEntry?.latitude ?? 0.0)
        longitudeTextField.text = String(logEntry?.longitude ?? 0.0)
        courseTextField.text = String(logEntry?.course ?? 0.0)
        speedTextField.text = String(logEntry?.speed ?? 0.0)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
