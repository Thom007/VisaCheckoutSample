//
//  ViewController.swift
//  VisaCheckoutSample
//
//  Created by for Work on 6/18/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import UIKit
import VisaCheckoutSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var checkoutButton: VisaCheckoutButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let profile = Profile(environment: .sandbox, apiKey: "5R6XSCWD62JFE9X7IWBM21CpobSCcMqKb5LWjdfi36jFr18zk", profileName: nil)
        let amount = CurrencyAmount(double: 23.09)
        let purchaseInfo = PurchaseInfo(total: amount, currency: .usd)
        
        checkoutButton.onCheckout(profile: profile, purchaseInfo: purchaseInfo, presenting: self) { result in
            switch result.statusName {
            case kVisaCheckoutResultPaymentSuccess:
                print("success")
            case kVisaCheckoutResultPaymentCancel:
                print("canceled")
            case kVisaCheckoutResultPaymentError:
                print("error")
            default:
                print("default")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

