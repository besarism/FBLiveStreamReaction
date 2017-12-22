//
//  ViewController.swift
//  FBLiveStreamReaction
//
//  Created by b3 on 12/14/17.
//  Copyright © 2017 b3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Facebook Live"
        let whiteBlue = UIColor(red:62/255, green:167/255 ,blue:186/255 , alpha:1.00)
        self.navigationController?.navigationBar.barTintColor = whiteBlue
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            UINavigationBar.appearance().tintColor = UIColor.white
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            
        }
            
        else {
            self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "GillSans", size: 20)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addLikesAndLoves)))
        
    }
    
    
    
    @objc func addLikesAndLoves() {
        for _ in 0...10 {
            
            //pick a random image between heart and love
            let image = drand48() > 0.4 ? #imageLiteral(resourceName: "like") : #imageLiteral(resourceName: "love")
            //Reaction "Buttons"(Images)
            let likeImageView = UIImageView(image: image)

            //drank48 takes a random number between 0 to 1
            let dimension = 20 + drand48() * 10
            
            //add the like and heart to vc
            view.addSubview(likeImageView)
            likeImageView.frame = CGRect(x: 0, y: 0, width: dimension, height: 30)

            
            //adding the animation for the like
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.path = curvedPath().cgPath
            animation.duration = 2.5 + drand48() * 2
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            likeImageView.layer.add(animation, forKey: nil)
            
        }
    }


}

func curvedPath() -> UIBezierPath {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width + 10
    let randomYPosition = 150 + drand48() * 200
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 200))
    let endPoint = CGPoint(x: screenWidth, y:300)
    let controlPoint1 = CGPoint(x: 200, y: 200 - randomYPosition)
    let controlPoint2 = CGPoint(x: 200, y: 300 + randomYPosition)
    path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    
    return path
}


class AnimationView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = curvedPath()
        
        path.lineWidth = 4
        path.stroke()
    }
}
