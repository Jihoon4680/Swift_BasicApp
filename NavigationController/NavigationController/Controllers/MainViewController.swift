//
//  MainViewController.swift
//  NavigationController
//
//  Created by 안지훈 on 2022/06/29.
//


import UIKit

class MainViewController:UIViewController{
    
    //제목
    var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    //버튼체인지
    var changeButton : UIButton = {
        let changebtn = UIButton(type: .system)
        changebtn.setTitle("배경색바꾸기", for: .normal)
        changebtn.setTitleColor(.black, for: .normal)
        changebtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        changebtn.backgroundColor = .white
        changebtn.layer.cornerRadius = 5
        changebtn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        changebtn.addTarget(self, action: #selector(changeBg), for: .touchUpInside)
        return changebtn
    }()
    
    var isBgOrange : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isBgOrange = true
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        view.addSubview(titleLabel)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeButton)
        self.changeButton.translatesAutoresizingMaskIntoConstraints = false
        self.changeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:20).isActive = true
        self.changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    @objc fileprivate func changeBg(){
        print("change background")
        if isBgOrange == true {
            // #colorLiteral()하면 색상지정가능, 
            view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            isBgOrange = false
        }
        else{
            view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            isBgOrange = true
        }
    }
    
}
