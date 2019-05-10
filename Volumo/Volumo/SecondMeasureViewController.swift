//
//  SecondMeasureViewController.swift
//  Volumo
//
//  Created by Ashwin Sajiv Purushothama Babu on 10/05/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit

class SecondMeasureViewController: UIViewController {
    var tempText = ""
    @IBAction func measureNext(_ sender: UIButton) {
        performSegue(withIdentifier: "measure2ToResults", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultsViewController
        vc.tempText = tempText
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
