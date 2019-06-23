//
//  ViewController.swift
//  Volumo
//  This views purpose is to display the shapes and pass the information to
//  the next view
//  Created by Ashwin Sajiv Purushothama Babu on 17/04/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var shapeButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var shape = ""
    var passingInfo = "" // Passes the selected shape to the next view
    // An enumerator to hold all the shapes
    enum Shapes: String {
        case cylinder = "Cylinder"
        case cone = "Cone"
        case hemisphere = "Hemisphere"
        case sphere = "Sphere"
        case cube = "Cube"
        case pyramid = "Pyramid"
        case cuboid = "Cuboid"
        case length = "Length"
    }
    @IBAction func shapeTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let shape = Shapes(rawValue: title) else {
            return
        }
        switch shape {
        case .cylinder:
            passingInfo = "Cylinder"
        case .cone:
            passingInfo = "Cone"
        case .hemisphere:
            passingInfo = "Hemisphere"
        case .sphere:
            passingInfo = "Sphere"
        case .cube:
            passingInfo = "Cube"
        case .pyramid:
            passingInfo = "Pyramid"
        case .cuboid:
            passingInfo = "Cuboid"
        case .length:
            passingInfo = "Length"
        default:
            print ("")
        }
        performSegue(withIdentifier: "mainToMeasure", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! MeasureViewController
            vc.tempText = passingInfo
    }
    // The list of buttons are hidden and displayed when tapped
    @IBAction func handleSelection(_ sender: UIButton) {
        shapeButtons.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue){}
}

