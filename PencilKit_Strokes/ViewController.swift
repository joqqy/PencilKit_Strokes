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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpPencilKit()
    }
    
    func setUpPencilKit() {
        
        self.canvasView = PKCanvasView(frame: self.view.bounds)
        guard let canvasView = canvasView else { fatalError() }
        canvasView.delegate = self
        canvasView.becomeFirstResponder()
        
        view.addSubview(canvasView)
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {

        let nextStrokeIndex: Int = canvasView.drawing.strokes.count
        print("nextStrokeIndex: \(nextStrokeIndex)")
        
    }
    
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
        canvasView.drawing = PKDrawing()
        canvasView.drawing.strokes.removeAll()
    }
}

