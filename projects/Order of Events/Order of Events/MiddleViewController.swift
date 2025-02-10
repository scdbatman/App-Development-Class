//
//  MiddleViewController.swift
//  Order of Events
//
//  Created by Samuel Bradshaw  on 2/10/25.
//

import UIKit

class MiddleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "view did load")
    }
    override func viewWillAppear(_ animated : Bool ) {
        super.viewWillAppear(animated)
        addEvent(from: "view will appear")
    }
    
    override func viewDidAppear(_ animated : Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "view did disappear")
    }

    @IBOutlet var updateLabelText: UILabel!
    var eventNumber = 1
    
    func addEvent(from: String) {
        if let existingText = updateLabelText.text {
            updateLabelText.text = "\(existingText)\n Event number \(eventNumber) was: \(from)"
            eventNumber += 1
        }
    }
}
