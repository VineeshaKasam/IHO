//
//  ViewController.swift
//  IHO
//
//  Created by vkasam on 3/22/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    //2. Create Our ARWorld Tracking Configuration
    let configuration = ARWorldTrackingConfiguration()
    
    //3. Create Our Session
    let augmentedRealitySession = ARSession()
    
    //4. Create A Variable To Store The Current Nodes Rotation Around It's Y-Axis
    var currentAngleY: Float = 0.0
    var isRotating = false
    var currentNode: SCNNode?
    @IBOutlet var infoLabel: UILabel!
    
    func addLucy(x: Float = 0, y: Float = 0, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/Lucy.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.002, 0.002, 0.002)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonRF(x: Float = -0.09, y: Float = -0.1, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonRL(x: Float = -0.07, y: Float = -0.25, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonPalm(x: Float = 0.099, y: Float = 0.08, z: Float = 0) {
    guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
    let LucyNodeH = SCNNode()
    let LucySceneChildNodes = LucyScene.rootNode.childNodes
    for childNode in LucySceneChildNodes {
    LucyNodeH.addChildNode(childNode)
    }
    LucyNodeH.position = SCNVector3(x, y, z)
    LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
    sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonHand(x: Float = -0.06, y: Float = 0.08, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonRBone(x: Float = -0.12, y: Float = -0.04, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonMidd(x: Float = -0.14, y: Float = -0.01, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLLeft(x: Float = -0.2, y: Float = -0.18, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLHand(x: Float = -0.2, y: Float = 0.085, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        LucyNodeH.name = "Sphere1"
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLSkull(x: Float = -0.13, y: Float = 0.085, z: Float = 0.025) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.009, 0.009, 0.009)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonHSkull(x: Float = -0.13, y: Float = 0.137, z: Float = 0.025) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        for childNode in LucySceneChildNodes {
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.006, 0.006, 0.006)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        addLucy()
        addButtonRF()
        addButtonRL()
        addButtonPalm()
        addButtonHand()
        addButtonRBone()
        addButtonMidd()
        addButtonLLeft()
        addButtonLHand()
        addButtonLSkull()
        addButtonHSkull()

        //Adding Text pop up
        let scaleGesture = UIPinchGestureRecognizer(target: self, action: #selector(scaleCurrentNode(_:)))
        self.view.addGestureRecognizer(scaleGesture)
        
        //3. Add A Tap Gesture Recogizer So We Can Place Our TextNode
       // let tapGesture = UITapGestureRecognizer(target: self, action: #selector(placeOrAssignNode(_:)))
        //self.view.addGestureRecognizer(tapGesture)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        guard let touchLocation = touches.first?.location(in: sceneView),
            let hitNode = sceneView?.hitTest(touchLocation, options: nil).first?.node,
            let nodeName = hitNode.name
            else{
                return
        }
        print(nodeName)
        
        if let hitTest = self.sceneView.hitTest(touchLocation, types: .featurePoint).first{
            
            //4. Get The World Transform
            let hitTestPosition = hitTest.worldTransform.columns.3
            
            //5. Add The TestNode At The Desired Position
            if nodeName == "Sphere"{
                let string = "Sphere 1"
                createTextFromPosition(SCNVector3(hitTestPosition.x, hitTestPosition.y, hitTestPosition.z), string)
                return
            }
            else{
                return
            }
        }
        currentNode?.removeFromParentNode()
        
    }
    func updatePositionAndOrientationOf(_ node: SCNNode, withPosition position: SCNVector3, relativeTo referenceNode: SCNNode) {
        let referenceNodeTransform = matrix_float4x4(referenceNode.transform)
        
        // Setup a translation matrix with the desired position
        var translationMatrix = matrix_identity_float4x4
        translationMatrix.columns.3.x = position.x
        translationMatrix.columns.3.y = position.y
        translationMatrix.columns.3.z = position.z
        
        // Combine the configured translation matrix with the referenceNode's transform to get the desired position AND orientation
        let updatedTransform = matrix_multiply(referenceNodeTransform, translationMatrix)
        node.transform = SCNMatrix4(updatedTransform)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
 */
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera:ARCamera, didFailWithError error: Error) {
        switch camera.trackingState {
        case .normal :
            infoLabel.text = "Move the device to detect horizontal surfaces."
            
        case .notAvailable:
            infoLabel.text = "Tracking not available."
            
        case .limited(.excessiveMotion):
            infoLabel.text = "Tracking limited - Move the device more slowly."
            
        case .limited(.insufficientFeatures):
            infoLabel.text = "Tracking limited - Point the device at an area with visible surface detail."
            
        case .limited(.initializing):
            infoLabel.text = "Initializing AR session."
            
        default:
            infoLabel.text = ""
        }
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        infoLabel.text = "Session was interrupted"
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        infoLabel.text = "Session interruption ended"
        resetTracking()
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func resetTracking() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //-----------------------
    //MARK: Touch Interaction
    //-----------------------
    
    /// Performs An ARHitTest Or SCNHitTest So We Can Place Or Assign Our TextNode
    ///
    /// - Parameter gesture: UITapGestureRecognizer
 /*   @objc func placeOrAssignNode(_ gesture: UITapGestureRecognizer){
        
        //1. Get The Current Location Of The Tap
        let currentTouchLocation = gesture.location(in: self.sceneView)
        
        //2. If We Hit An SCNNode Set It As The Current Node So We Can Interact With It
        if let nodeHitTest = self.sceneView.hitTest(currentTouchLocation, options: nil).first?.node{
            
            currentNode = nodeHitTest
            return
        }
        
        //3. Do An ARHitTest For Features Points So We Can Place An SCNNode
        if let hitTest = self.sceneView.hitTest(currentTouchLocation, types: .featurePoint).first {
            
            //4. Get The World Transform
            let hitTestPosition = hitTest.worldTransform.columns.3
            
            //5. Add The TestNode At The Desired Position
            createTextFromPosition(SCNVector3(hitTestPosition.x, hitTestPosition.y, hitTestPosition.z))
            return
            
        }
        currentNode?.removeFromParentNode()
        
    } */
    
    //-------------------
    //MARK: Node Creation
    //-------------------
    
    /// Creates An SCNNode With An SCNTextGeometry
    ///
    /// - Parameter position: SCNVector3
    func createTextFromPosition(_ position: SCNVector3, _ name: String){
        
        let string = name
        let text = SCNText(string: string, extrusionDepth: 0.1)
        text.font = UIFont.systemFont(ofSize: 1)
        text.flatness = 0.005
        let textNode = SCNNode(geometry: text)
        let fontScale: Float = 0.01
        textNode.scale = SCNVector3(fontScale, fontScale, fontScale)
        let (min, max) = (text.boundingBox.min, text.boundingBox.max)
        let dx = min.x + 0.5 * (max.x - min.x)
        let dy = min.y + 0.5 * (max.y - min.y)
        let dz = min.z + 0.5 * (max.z - min.z)
        textNode.pivot = SCNMatrix4MakeTranslation(dx, dy, dz)
        let width = (max.x - min.x) * fontScale
        let height = (max.y - min.y) * fontScale
        let plane = SCNPlane(width: CGFloat(width), height: CGFloat(height))
        let planeNode = SCNNode(geometry: plane)
        planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.5)
        planeNode.geometry?.firstMaterial?.isDoubleSided = true
        planeNode.position = textNode.position
        textNode.eulerAngles = planeNode.eulerAngles
        planeNode.addChildNode(textNode)
        sceneView.scene.rootNode.addChildNode(planeNode);
        currentNode = planeNode;
        
    }
    
    
    //-------------
    //MARK: Scaling
    //-------------
    
    /// Scales The Currently Selected Node
    ///
    /// - Parameter gesture: UIPinchGestureRecognizer
    @objc func scaleCurrentNode(_ gesture: UIPinchGestureRecognizer) {
        
        if !isRotating, let selectedNode = currentNode{
            
            if gesture.state == .changed {
                
                let pinchScaleX: CGFloat = gesture.scale * CGFloat((selectedNode.scale.x))
                let pinchScaleY: CGFloat = gesture.scale * CGFloat((selectedNode.scale.y))
                let pinchScaleZ: CGFloat = gesture.scale * CGFloat((selectedNode.scale.z))
                selectedNode.scale = SCNVector3Make(Float(pinchScaleX), Float(pinchScaleY), Float(pinchScaleZ))
                gesture.scale = 1
                
            }
            
            if gesture.state == .ended {}
        }
        currentNode?.removeFromParentNode()
    }
}