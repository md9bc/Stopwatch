//
//  ViewController.swift
//  Stopwatch
//
//  Created by Ma'ayan Doron on 9/14/17.
//  Copyright © 2017 Ma'ayan Doron. All rights reserved.
//

import UIKit

//Get the stopwatch working in HomeViewController
class HomeViewController: UIViewController {
    
    //You need to hook up this IBOutlet to the label in the storyboard for HomeViewController
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    let stopwatch = Stopwatch()
    
    @IBAction func startTimer(sender: UIButton){
        print("Starting stopwatch...")
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomeViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        stopwatch.start()    }
    
    @IBAction func stopTimer(sender: UIButton){
        print(stopwatch.elapsedTime)
        stopwatch.stop()
    }
    
    // This function gets data ready to be sent over to another scene.  Notice how we get the navigation controller first, then get the view controller embedded inside it.
    // Setup the time to be sent over to the next view controller here.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // NOTE: You'll need to click on the seque you create and give it the name "AddTime" for this to work!
        if (segue.identifier == "AddTime") {
            
            print(segue.destination)
            if let destinationNC = segue.destination as? UINavigationController{
                let destinationVC = destinationNC.topViewController as! AddTimeViewController
                destinationVC.nameToDisplay =
                ???????
            }
            
        
            // let targetController = destinationVC.topViewController as! AddTimeViewController
            
            // ADD CODE: Get the data ready to send over to the next controller by setting the fields over in the AddTimeViewController
            
            
            //It should have a label in the middle that it prepopulated with the current value of the elapsedTimeLabel in the 'HomeViewController' when the 'AddTimeViewController is launched' (note: this label's value will be static, it won't update like the elapsedTimeLabel)
            
            
            
        }
    }
    //no edits beyond this point
    func updateElapsedTimeLabel(_ timer: Timer){
        print("Updating...")
        if stopwatch.isRunning{
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenthsOfSecond = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            elapsedTimeLabel.text = String(format: "%02d:%02d.%d", minutes, seconds, tenthsOfSecond)
        }
        else{
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

