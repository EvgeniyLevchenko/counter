//
//  ViewController.swift
//  counter
//
//  Created by QwertY on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var tapOrHold: UIButton!
    
    let formatter = NumberFormatter()
    var counter: Int = 0
    var timer: Timer = Timer()
    
    @IBAction func resetButton(_ sender: Any) {
        self.counter = 0
        self.counterLabel.text = String(self.counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        longPressRecognizer.numberOfTouchesRequired = 1
        longPressRecognizer.minimumPressDuration = 0.5
        tapOrHold.addGestureRecognizer(longPressRecognizer)
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        counter += 1
        counterLabel.text = String(counter)
    }

    @objc func longPressed(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(tapped(_:)), userInfo: nil, repeats: true)
        case .changed:
            counter = formatter.number(from: counterLabel.text!)!.intValue + 1
            counterLabel.text = String(counter)
        case .ended:
            timer.invalidate()
        default:
            break
        }
    }
}


