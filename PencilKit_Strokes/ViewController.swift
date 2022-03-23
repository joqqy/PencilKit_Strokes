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
    var gestureRecognizer: UIGestureRecognizer?

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
        
        self.gestureRecognizer = canvasView.drawingGestureRecognizer
        self.gestureRecognizer?.addTarget(self, action: #selector(gestureAction))
        
        view.addSubview(canvasView)
    }
    
    @objc
    func gestureAction() {
        
        switch self.gestureRecognizer?.state
        {
        case .began:
            print(".began")
            
        case .changed:
            print(".changed")
            
        case .ended:
            print(".ended")
            
        case .cancelled:
            print(".cancelled")
            
        default:
            break
        }
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {}
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
//        for stroke in canvasView.drawing.strokes {

            // Getting the actual points on the path
            // ref: https://developer.apple.com/videos/play/wwdc2020/10148/ timestamp: 7:55
            // see WWDC2020 example Handwriting tutor, TextGenerator, method loadAndSplitDrawing(...)
            
//            var newPoints = [PKStrokePoint]()
//            for parametricValue in stroke.path.indices {
//
//                //print (stroke.path.interpolatedPoint(at: CGFloat(parametricValue)))
//                let strokePoint = stroke.path.interpolatedPoint(at: CGFloat(parametricValue))
//                newPoints.append(strokePoint)
//            }
//
//            print("newPoints.count: \(newPoints.count)")
//        }

    }
    
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
        
        for stroke in canvasView.drawing.strokes {
        
            var newPoints = [PKStrokePoint]()
            for parametricValue in stroke.path.indices {
                
                //print (stroke.path.interpolatedPoint(at: CGFloat(parametricValue)))
                let strokePoint = stroke.path.interpolatedPoint(at: CGFloat(parametricValue))
                newPoints.append(strokePoint)
            }
            
            print("newPoints.count: \(newPoints.count)")
        }
        
        canvasView.drawing = PKDrawing()
        
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {

//        for stroke in canvasView.drawing.strokes {
//
//            // Getting the actual points on the path
//            // ref: https://developer.apple.com/videos/play/wwdc2020/10148/ timestamp: 7:55
//            // see WWDC2020 example Handwriting tutor, TextGenerator, method loadAndSplitDrawing(...)
//
//            var newPoints = [PKStrokePoint]()
//            for parametricValue in stroke.path.indices {
//
//                //print (stroke.path.interpolatedPoint(at: CGFloat(parametricValue)))
//                let strokePoint = stroke.path.interpolatedPoint(at: CGFloat(parametricValue))
//                newPoints.append(strokePoint)
//            }
//
//            print("newPoints.count: \(newPoints.count)")
//        }
        
        //canvasView.drawing = PKDrawing()
        //canvasView.drawing.strokes.removeAll()
//        print("canvasView.drawing.strokes.count: \(canvasView.drawing.strokes.count)")
    }
}

