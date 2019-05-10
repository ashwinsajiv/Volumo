//
//  MeasureViewController.swift
//  Volumo
//
//  Created by Ashwin Sajiv Purushothama Babu on 19/04/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit

class MeasureViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    var tempText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tempLabel.text = tempText
        
    }
    
    
    @IBAction func Measure(_ sender: UIButton) {
        if !(tempText == "sphere" || tempText == "cube"){
        performSegue(withIdentifier: "measureToMeasure", sender: self)
        }
        else {
            performSegue(withIdentifier: "measure1ToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "measureToMeasure"){
            let vc = segue.destination as! SecondMeasureViewController
            vc.tempText = self.tempText
        }
        else if (segue.identifier == "measure1ToResults"){
            let vc = segue.destination as! ResultsViewController
            vc.tempText = self.tempText
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
