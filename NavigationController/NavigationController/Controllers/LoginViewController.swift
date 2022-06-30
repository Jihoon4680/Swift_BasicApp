//
//  ViewController.swift
//  NavigationController
//
//  Created by 안지훈 on 2022/06/28.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        //상단 네비게이션 바 hidden처리
        self.navigationController?.isNavigationBarHidden = true
        
        btnLogin.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)
    }
    
    @objc fileprivate func moveToMainViewController(){
        print("loginButtonClick- cancelLoginButton")
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }


}

