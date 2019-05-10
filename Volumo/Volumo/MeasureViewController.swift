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
        performSegue(withIdentifier: "measureToMeasure", sender: self)
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
