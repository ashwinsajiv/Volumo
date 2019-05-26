//
//  MeasureViewController.swift
//  Volumo
//
//  Created by Ashwin Sajiv Purushothama Babu on 19/04/19.
//  Copyright © 2019 Ashwin Sajiv Purushothama Babu. All rights reserved.
//

import UIKit
import ARKit

class MeasureViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var distance: UILabel!
    var startingPosition: SCNNode?
    let configuration = ARWorldTrackingConfiguration()
    var tempText = ""
    var tempDistance1 = Float(0)
    var i = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        self.sceneView.delegate = self
        if (tempText == "Length"){
            let alert = UIAlertController(title: "Alert", message: "Measure length", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (tempText == "Cylinder" || tempText == "Cone" || tempText == "Cube" || tempText == "Cuboid" || tempText == "Pyramid"){
            let alert = UIAlertController(title: "Alert", message: "Measure height", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Measure diameter", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let sceneView = sender.view as? ARSCNView else {return}
        guard let currentFrame = sceneView.session.currentFrame else {return}
        if self.startingPosition != nil {
            self.startingPosition?.removeFromParentNode()
            self.startingPosition = nil
            return
        }
        let camera = currentFrame.camera
        let transform = camera.transform
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.005))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        sphere.simdTransform = transform
        self.sceneView.scene.rootNode.addChildNode(sphere)
        self.startingPosition = sphere
    }
    @IBAction func Measure(_ sender: UIButton) {
        if !(tempText == "Sphere" || tempText == "Cube" || tempText == "Hemisphere" || tempText == "Length"){
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
            vc.tempDistance1 = self.tempDistance1

        }
        else if (segue.identifier == "measure1ToResults"){
            let vc = segue.destination as! ResultsViewController
            vc.tempText = self.tempText
            vc.tempDistance1 = self.tempDistance1
        }
    }
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        guard let startingPosition = self.startingPosition else {return}
        guard let pointOfView = self.sceneView.pointOfView else {return}
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.005))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        let transform = pointOfView.transform
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        sphere.position = SCNVector3(location.x, location.y, location.z - 0.1)
        self.sceneView.scene.rootNode.addChildNode(sphere)
        let xDistance = location.x - startingPosition.position.x
        let yDistance = location.y - startingPosition.position.y
        let zDistance = location.z - startingPosition.position.z
        DispatchQueue.main.async {
            self.distance.text = String(format: "%.2f", self.distanceTravelled(x: xDistance, y: yDistance, z: zDistance)) + "m"
            self.tempDistance1 = Float(self.distanceTravelled(x: xDistance, y: yDistance, z: zDistance))
        }
    }
    
    func distanceTravelled(x: Float, y: Float, z: Float) -> Float {
        return (sqrtf(x*x + y*y + z*z))
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
