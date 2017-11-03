//
//  SelectionViewController.swift
//  Roshambo
//
//  Created by xengar on 2017-11-03.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var user : Int = 0
    
    
    // Prepare for launch a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        
        if self.user == 1 { // rock
            controller.selectionValue = 1
            self.user = 0
        } else { // paper
            controller.selectionValue = 3
            self.user = 0
        }
    }
    
    // Call the ResultsViewController
    @IBAction func callResults() {
        
        // Get the ResultsViewController
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        // Set the user value to scissors
        controller.selectionValue = 2
        
        // Present the view Controller
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func callResultsUsingCodeAndStoryBoard() {
        // user selected rock, mark it
        self.user = 1
        performSegue(withIdentifier: "callResultsUsingCodeAndStoryBoard", sender: self)
    }


}

