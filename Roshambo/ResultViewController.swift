//
//  ResultViewController.swift
//  Roshambo
//
//  Created by xengar on 2017-11-03.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    // MARK: Properties
    var selectionValue: Int?
    
    // MARK: Outlets
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelMessage: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let computerValue = randomValue()
        
        // select the image according to the selection
        if let selectionValue = self.selectionValue {
            calculateResults(player: selectionValue, machine: computerValue)
        } else {
            self.resultImage.image = nil;
        }
        self.resultImage.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.resultImage.alpha = 1
        }
    }
    
    /**
     * Randomly generates a Int from 1 to 3
     */
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    
    // Asssigne the messages and image
    func calculateResults(player: Int, machine: Int) {
        switch (player, machine) {
        case (1, 1): // Rock, Rock
            self.labelTitle.text = "It's a tie!"
            self.labelMessage.text = "Rock vs Rock!"
            self.resultImage.image = UIImage(named: "itsATie")
        case (1, 2): // Rock, Scissors
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Rock breaks Scissors!"
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
        case (1, 3): // Rock, Paper
            self.labelTitle.text = "You Lose!"
            self.labelMessage.text = "Rock are covered with Paper!"
            self.resultImage.image = UIImage(named: "PaperCoversRock")
            
        case (2, 1): // Scissors, Rock
            self.labelTitle.text = "You Lose!"
            self.labelMessage.text = "Scissors are breaked with Rock!"
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
        case (2, 2): // Scissors, Scissors
            self.labelTitle.text = "It's a tie!"
            self.labelMessage.text = "Scissors vs Scissors!"
            self.resultImage.image = UIImage(named: "itsATie")
        case (2, 3): // Scissors, Paper
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Scissors cut Paper!"
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
            
        case (3, 1): // Paper, Rock
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers Rock!"
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        case (3, 2): // Paper, Scissors
            self.labelTitle.text = "You Lose!"
            self.labelMessage.text = "Paper is cut by Scissors!"
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        case (3, 3): // Paper, Paper
            self.labelTitle.text = "It's a tie!"
            self.labelMessage.text = "Paper vs Paper!"
            self.resultImage.image = UIImage(named: "itsATie")
            
        default:
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers rock!"
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        }
    }
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
