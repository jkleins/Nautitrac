//
//  NewTripViewController.swift
//  Nautitrac
//
//  Created by James Kleinschmidt on 7/22/18.
//  Copyright © 2018 Seven Bends Software. All rights reserved.
//

import UIKit

class NewTripViewController: UIViewController {

    @IBAction func saveButton(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
