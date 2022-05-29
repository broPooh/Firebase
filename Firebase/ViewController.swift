//
//  ViewController.swift
//  Firebase
//
//  Created by bro on 2022/05/28.
//

import UIKit
import FirebaseCore
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //회원가입: 아이디(100) -> 닉네임(90) -> 연락처(50) -> 성별(10) -> 가입 완료(5)
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-Firebase",
          AnalyticsParameterItemName: "Firebase",
          AnalyticsParameterContentType: "cont",
        ])
        
        Analytics.logEvent("share_image", parameters: [
          "name": "Jacl" as NSObject,
          "full_text": "test" as NSObject,
        ])
        
        let button = UIButton(type: .roundedRect)
              button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
              button.setTitle("Test Crash", for: [])
              button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
              view.addSubview(button)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let numbers = [0]
        let _ = numbers[1]
    }
}

