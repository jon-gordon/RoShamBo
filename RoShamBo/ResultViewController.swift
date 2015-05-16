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
    
    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
