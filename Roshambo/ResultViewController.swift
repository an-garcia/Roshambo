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
        // select the image according to the selection
        if let selectionValue = self.selectionValue {
            assignImage(value: selectionValue)
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
    
    // Assigns the image
    func assignImage(value: Int) {
        
        switch value {
        case 1: //Rock
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        case 2: // Scissors
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
        case 3: // Paper
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        default:
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        }
    }
    
    // Asssigne the message
    func assignMessage(player: Int, machine: Int) {
        switch player {
        case 1:
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers rock!"
        case 2:
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers rock!"
        case 3:
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers rock!"
        default:
            self.labelTitle.text = "You Win!"
            self.labelMessage.text = "Paper covers rock!"
        }
    }
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
