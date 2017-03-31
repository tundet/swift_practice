//
//  ViewController.swift
//  Drawing App
//
//  Created by Tünde Taba on 30.3.2017.
//  Copyright © 2017 Tünde Taba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var lastPoint = CGPoint.zero
    var swiped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
    }
    
    func saveImage() {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let drawing = renderer.image{
            ctx in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        let imageData = UIImageJPEGRepresentation(drawing, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        //UIAlertView is deprecated
        let alert = UIAlertView(title: "Saved",
                                message: "What an ugly drawing...",
                                delegate: nil,
                                cancelButtonTitle: "Thanks")
        alert.show()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        saveImage()
    }
    
    @IBAction func saveItem(_ sender: Any) {
        saveImage()
    }
    
    @IBAction func resetItem(_ sender: Any) {
        imageView.image = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

