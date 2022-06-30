//
//  ResiterViewController.swift
//  NavigationController
//
//  Created by 안지훈 on 2022/06/28.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func btnForLoginViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
