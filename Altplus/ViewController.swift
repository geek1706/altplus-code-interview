//
//  ViewController.swift
//  Altplus
//
//  Created by ios on 7/16/18.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    
    let size = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let g1 = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        g1.direction = .left
        
        view.addGestureRecognizer(g1)
        
        let g2 = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        g2.direction = .right
        
        view.addGestureRecognizer(g2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            UIView.animate(withDuration: 0.2) {
                self.centerXConstraint.constant = -UIScreen.main.bounds.width/2 + self.size.width/2
                self.view.layoutIfNeeded()
            }
        case .right:
            UIView.animate(withDuration: 0.2) {
                self.centerXConstraint.constant = UIScreen.main.bounds.width/2 - self.size.width/2
                self.view.layoutIfNeeded()
            }
        default:
            break
        }
    }
}

