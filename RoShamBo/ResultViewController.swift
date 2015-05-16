//
//  ResultViewController.swift
//  RoShamBo
//
//  Created by Jon Gordon on 15/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!

    var move: Match!
    var message: NSString!
    var image: UIImage!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.text = outcomeMessage(move)
        self.resultImage.image = outcomeImage(move)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animateWithDuration(1.5) {
            self.resultImage.alpha = 1;
        }
    }

    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func outcomeMessage(match: Match) -> String {

        // Handle the tie first
        if (match.p1 == match.p2) {
            return "It's a tie!"
        }

        // Here we build up the winning string
        return match.winner.description + " " + outcomeType(match.winner) + " " + match.loser.description + "! " +
            outcomeResult(match)
    }

    func outcomeType(gesture: RoShamBo) -> String {
        switch (gesture) {
        case .Rock:
            return "crushes"
        case .Paper:
            return "covers"
        case .Scissors:
            return "cuts"
        }
    }

    func outcomeResult(match: Match) -> String {
        return match.p1.beats(match.p2) ? "You win" : "You lose"
    }

    func outcomeImage(match: Match) -> UIImage {
        var name = ""

        switch (match.winner) {
        case .Rock:
            name = "winRock"
        case .Paper:
            name = "winPaper"
        case .Scissors:
            name = "winScissors"
        }

        if match.p1 == match.p2 {
            name = "tie"
        }

        return UIImage(named: name)!
    }
}
