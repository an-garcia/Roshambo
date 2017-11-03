//
//  SelectionViewController.swift
//  Roshambo
//
//  Created by xengar on 2017-11-03.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    /**
     * Randomly generates a Int from 1 to 6
     */
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    // Prepare for launch a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.selectionValue = randomValue()
    }
    
    // Call the ResultsViewController
    @IBAction func callResults() {
        
        // Get the ResultsViewController
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        // Set the two values to random numbers from 1 to 6
        controller.selectionValue = randomValue()
        
        // Present the view Controller
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func callResultsUsingCodeAndStoryBoard() {
        performSegue(withIdentifier: "callResultsUsingCodeAndStoryBoard", sender: self)
    }


}

