//
//  ResultsViewController.swift
//  Volumo
//
//  Created by Ashwin Sajiv Purushothama Babu on 20/04/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit
import ARKit

class ResultsViewController: UIViewController, ARSCNViewDelegate {
    var tempText = ""
    var tempDistance1 = Float(0)
    var tempDistance2 = Float(0)
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        let node = SCNNode()
        if (tempText == "Cylinder") {
            print(tempDistance1,tempDistance2,tempText)
            let result = 3.14 * (tempDistance2/2) * (tempDistance2/2) * tempDistance1
            let outputString = "The volume is " + String(format: "%.4f",result) + " cubic meters"
            print(result)
            node.geometry = SCNCylinder(radius: CGFloat(tempDistance2/2), height: CGFloat(tempDistance1))
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            node.geometry?.firstMaterial?.specular.contents = UIColor.white
            node.position = SCNVector3(0, 0.1, -0.2)
            self.sceneView.scene.rootNode.addChildNode(node)
        }
        else if (tempText == "Cone") {
            print(tempDistance1,tempDistance2,tempText)
            let result = 0.33 * 3.14 * (tempDistance2/2) * (tempDistance2/2) * tempDistance1
            print(result)
            node.geometry = SCNCone(topRadius: 0, bottomRadius: CGFloat(tempDistance2/2), height: CGFloat(tempDistance1))
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            node.geometry?.firstMaterial?.specular.contents = UIColor.white
            node.position = SCNVector3(0, 0, -0.1)
            self.sceneView.scene.rootNode.addChildNode(node)
        }
        else if (tempText == "Hemisphere") {
            print(tempDistance1,tempDistance2,tempText)
            let result = 0.5 * 3.14 * (tempDistance1/2) * (tempDistance1/2)
            print(result)
        }
        else if (tempText == "Sphere") {
            print(tempDistance1,tempDistance2,tempText)
            let result = 3.14 * (tempDistance1/2) * (tempDistance1/2)
            print(result)
            node.geometry = SCNSphere(radius: CGFloat(tempDistance1/2))
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            node.geometry?.firstMaterial?.specular.contents = UIColor.white
            node.position = SCNVector3(0, 0, -0.1)
            self.sceneView.scene.rootNode.addChildNode(node)
        }
        else if (tempText == "Cube") {
            print(tempDistance1,tempDistance2,tempText)
            let result = tempDistance1 * tempDistance1 * tempDistance1
            print(result)
            node.geometry = SCNBox(width: CGFloat(tempDistance1), height: CGFloat(tempDistance1), length: CGFloat(tempDistance1), chamferRadius: 0)
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            node.geometry?.firstMaterial?.specular.contents = UIColor.white
            node.position = SCNVector3(0, 0, -0.1)
            self.sceneView.scene.rootNode.addChildNode(node)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Home(_ sender: UIButton) {
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
