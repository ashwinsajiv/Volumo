//
//  ViewController.swift
//  Volumo
//
//  Created by Ashwin Sajiv Purushothama Babu on 17/04/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var shape = ""
    var passingInfo = ""
    enum Shapes: String {
        case cylinder = "Cylinder"
        case cone = "Cone"
        case pyramid = "Pyramid"
        case sphere = "Sphere"
        case cube = "Cube"
    }
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let shape = Shapes(rawValue: title) else {
            return
        }
        switch shape {
        case .cylinder:
            passingInfo = "cylinder"
        case .cone:
            passingInfo = "cone"
        case .pyramid:
            passingInfo = "pyramid"
        case .sphere:
            passingInfo = "sphere"
        case .cube:
            passingInfo = "cube"
        default:
            print ("")
        }
            performSegue(withIdentifier: "mainToMeasure", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mainToMeasure"){
            let vc = segue.destination as! MeasureViewController
            vc.tempText = passingInfo
        }
    }
    @IBAction func handleSelection(_ sender: UIButton) {
        cityButtons.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue){}
}

