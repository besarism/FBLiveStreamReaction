//
//  ViewController.swift
//  FBLiveStreamReaction
//
//  Created by b3 on 12/14/17.
//  Copyright © 2017 b3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(frame: view.frame)
        animationView.backgroundColor = .red
        
        //add the animationView on the ViewController
        view.addSubview(animationView)
    }


}

class AnimationView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 200))
        let endPoint = CGPoint(x: self.frame.width, y:200)
        let cp1 = CGPoint(x: 100, y: 200)
        let cp2 = CGPoint(x: 200, y: 200)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = 4
       
        path.stroke()
        
    }
}
