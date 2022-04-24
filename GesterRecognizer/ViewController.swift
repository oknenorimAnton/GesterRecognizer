//
//  ViewController.swift
//  GesterRecognizer
//
//  Created by Антон on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObserves()
        tapObservers()
        
    }
    
    func swipesObserves() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector (handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObservers() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector (TripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector (DoubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes( gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "Right swipes"
        case .left:
            label.text = "Left swipes"
        case .up:
            label.text = "Up swipes"
        case .down:
            label.text = "Down swipes"
        default:
            break
        }
    }
    
    @objc func TripleTapAction() {
        label.text = "Triple Tap"
}
    
    @objc func DoubleTapAction() {
        label.text = "Double Tap"
    }
}

