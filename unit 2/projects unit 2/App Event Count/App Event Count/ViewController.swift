//
//  ViewController.swift
//  App Event Count
//
//  Created by Samuel Bradshaw  on 3/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var configuredForConnectionLabel: UILabel!
    @IBOutlet var willConnectToLabel: UILabel!
    var willConnectCount = 0
    @IBOutlet var didBecomeActiveLabel: UILabel!
    var didBecomeActiveCount = 0
    @IBOutlet var sceneWillResignActiveLabel: UILabel!
    var willResignCount = 0
    @IBOutlet var sceneWillEnterForegroundLabel: UILabel!
    var willEnterForegroundCount = 0
    @IBOutlet var sceneDidEnterBackgroundLabel: UILabel!
    var didEnterBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "This app has launched \(appDelegate.launchCount) times."
        configuredForConnectionLabel.text = "This app has configured \(appDelegate.configureForConnectingCount) times."
        willConnectToLabel.text = "This app has entered will be active scene \(willConnectCount) times."
        didBecomeActiveLabel.text = "This app has entered did become active scene \(didBecomeActiveCount) times."
        sceneWillResignActiveLabel.text = "This app has entered resign active scene \(willResignCount) times"
        sceneWillEnterForegroundLabel.text = "This app has entered foreground scene \(willEnterForegroundCount) times"
        sceneDidEnterBackgroundLabel.text = "This app has entered background scene \(didEnterBackgroundCount) times"
    }
    
        


}

