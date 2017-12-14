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
        setupViews()
    }
    
    
    //Setting up views here
    
    func setupViews() {
        let animationView = AnimationView(frame: view.frame)
        animationView.backgroundColor = .red
        
        //add the animationView on the ViewController
        view.addSubview(animationView)
        
        //Reaction "Buttons"(Images)
        let likeImageView = UIImageView(image: #imageLiteral(resourceName: "like"))
        
        //add the like to vc
        view.addSubview(likeImageView)
        likeImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        //adding the animation for the like
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = curvedPath().cgPath
        animation.duration = 3
        likeImageView.layer.add(animation, forKey: nil)
        

    }


}

func curvedPath() -> UIBezierPath {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 200))
    let endPoint = CGPoint(x: screenWidth, y:200)
    let cp1 = CGPoint(x: 100, y: 100)
    let cp2 = CGPoint(x: 200, y: 300)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    return path
}


class AnimationView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = curvedPath()
        
        path.lineWidth = 4
        path.stroke()
    }
}
