//
//  MainViewController.swift
//  RoShamBo
//
//  Created by Jon Gordon on 15/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var playRock: UIButton!
    @IBOutlet weak var playPaper: UIButton!
    @IBOutlet weak var playScissors: UIButton!
    var move: Match!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playMove(sender: UIButton) {
        switch (sender) {
        case self.playRock:
            throwDown(RoShamBo.Rock)
        case self.playPaper:
            throwDown(RoShamBo.Paper)
        case self.playScissors:
            throwDown(RoShamBo.Scissors)

        default:
            assert(false, "Unknown button press");
        }
    }

    func throwDown(playerMove: RoShamBo) {
        // Generate a new RoShamBo object, creating opponent's move
        let opponentMove = RoShamBo()

        self.move = Match(p1: playerMove, p2: opponentMove)

        // Now we would liek to experiment with 3 different ways of segueing to the next view
        // Handy - we had 3 buttons so let's switch on those

        // 1. Programmatically segue
        if (playerMove == RoShamBo.Rock) {
            // Get storyboard and ResultViewController
            var storyboard = UIStoryboard (name: "Main", bundle: nil)
            var resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController

            // Communicate the match
            resultVC.move = self.move
            self.presentViewController(resultVC, animated: true, completion: nil)
        }

        // 2. Code with segue
        if (playerMove == RoShamBo.Paper) {
            performSegueWithIdentifier("playPaper", sender: self)
        }

        // 3. Segue via storyboard (direct from rock button)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // This is for both segue 2 and 3
        let controller = segue.destinationViewController as! ResultViewController
        controller.move = self.move
    }
}

