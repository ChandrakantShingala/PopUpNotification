//
//  ViewController.swift
//  PopUpNotification
//
//  Created by Chandrakant Shingala on 21/03/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    @IBOutlet weak var rNumber: UILabel!
    
    @IBOutlet weak var getOTPButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    @IBOutlet weak var naviButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
   
        var randomNumber = Int.random(in: 100000...999999)
    

    @IBAction func getOTPButtonTapped(_ sender: UIButton) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { allowed, error in
            if allowed
            {
             print("Permission Granted")
            } else {
                print("Permission UnGranted")

            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Domino's Pizza"
        content.body = "OTP \(randomNumber)"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            print("Error \(error?.localizedDescription ?? "")")
        }
    }
    
    
    
    @IBAction func naviButtonTapped(_ sender: UIButton) {
        
        if textField.text == String(randomNumber){
            let Sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let hhViewController: hViewController = Sb.instantiateViewController(withIdentifier: "hViewController") as! hViewController
            navigationController?.pushViewController(hhViewController, animated: true)
        }
    }
    
}

