//
//  ViewController2.swift
//  Altplus
//
//  Created by ios on 7/16/18.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var stackview1: UIStackView!
    @IBOutlet weak var stackview2: UIStackView!
    @IBOutlet weak var stackview3: UIStackView!
    @IBOutlet weak var stackview4: UIStackView!
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        let now = Date()
        let yearEnd = dateFormatter.date(from: "31/12/2018 23:59")!
        
        let components = NSCalendar.current.dateComponents([.day, .hour, .minute, .second], from: now, to: yearEnd)
        
        print(components)
        
        if let day = components.day {
            setup(day, stackview: stackview1)
        }
        
        if let hour = components.hour {
            setup(hour, stackview: stackview2)
        }
        
        if let minute = components.minute {
            setup(minute, stackview: stackview3)
        }
        
        if let second = components.second {
            setup(second, stackview: stackview4)
        }
    }
    
    func setup(_ value: Int, stackview: UIStackView) {
        stackview.removeAll()
        
        let v1 = UIView()
        v1.translatesAutoresizingMaskIntoConstraints = false
        stackview.addArrangedSubview(v1)
        
        let imageNames = images(from: value)
        let views = imageNames.map { (string) -> UILabel in
            let label = CustomLabel()
            label.text = string
            label.textAlignment = .center
            return label
        }
        
        for view in views {
            stackview.addArrangedSubview(view)
        }
        
        let v2 = UIView()
        v2.translatesAutoresizingMaskIntoConstraints = false
        stackview.addArrangedSubview(v2)
        
        NSLayoutConstraint.activate([
            v1.widthAnchor.constraint(equalTo: v2.widthAnchor)
            ])
    }
    
    func images(from int: Int) -> [String] {
        var value = int
        var images = [String]()
        
        repeat {
            images.append("\(value%10)")
            value /= 10
        } while value > 0
        
        return images.reversed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class CustomLabel: UILabel {
}

extension UIStackView {
    func removeAll() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}
