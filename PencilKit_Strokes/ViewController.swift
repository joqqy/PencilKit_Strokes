//
//  ViewController.swift
//  PencilKit_Strokes
//
//  Created by Pierre Hanna on 2022-03-23.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate {
    
    var canvasView: PKCanvasView?
    
    var animatingStroke: PKStroke?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpPencilKit()
    }
    
    func setUpPencilKit() {
        
        self.canvasView = PKCanvasView(frame: self.view.bounds)
        guard let canvasView = canvasView else { fatalError() }
        
        canvasView.isOpaque = false
        canvasView.backgroundColor = .clear
        
        canvasView.delegate = self
        canvasView.becomeFirstResponder()
        
        view.addSubview(canvasView)
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {

//        let nextStrokeIndex: Int = canvasView.drawing.strokes.count
//        print("nextStrokeIndex: \(nextStrokeIndex)")
    }
    
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
//        let strokes: [PKStroke] = canvasView.drawing.strokes
//        print("strokes: \(strokes.count)")
//        for i in strokes {
//            print(i)
//        }
        
        for stroke in canvasView.drawing.strokes {
            
//            var newPoints = [PKStrokePoint]()
//            stroke.path.forEach { point in
//
//                let newPoint = PKStrokePoint(location: point.location,
//                                             timeOffset: point.timeOffset,
//                                             size: point.size,
//                                             opacity: point.opacity,
//                                             force: point.force,
//                                             azimuth: point.azimuth,
//                                             altitude: point.altitude)
//
//                newPoints.append(newPoint)
//            }
//
//            if newPoints.count > 0 {
//                print("location:    \(String(describing: newPoints.first?.location))")
//                print("timeOffset:  \(String(describing: newPoints.first?.timeOffset))")
//                print("size:        \(String(describing: newPoints.first?.size))")
//                print("opacity:     \(String(describing: newPoints.first?.opacity))")
//                print("force:       \(String(describing: newPoints.first?.force))")
//                print("azimuth:     \(String(describing: newPoints.first?.azimuth))")
//                print("altitude:    \(String(describing: newPoints.first?.altitude))")
//            }
//
            // Getting the actual points on the path
            // ref: https://developer.apple.com/videos/play/wwdc2020/10148/ timestamp: 7:55
            var newPoints = [PKStrokePoint]()
            for parametricValue in stroke.path.indices {
                
                //print (stroke.path.interpolatedPoint(at: CGFloat(parametricValue)))
                let strokePoint = stroke.path.interpolatedPoint(at: CGFloat(parametricValue))
                newPoints.append(strokePoint)
            }
            
            print("newPoints.count: \(newPoints.count)")
        }
        
        //canvasView.drawing = PKDrawing()
        //canvasView.drawing.strokes.removeAll()
        print("canvasView.drawing.strokes.count: \(canvasView.drawing.strokes.count)")
    }
}

