//
//  ViewController.swift
//  FirstIOS
//
//  Created by 안지훈 on 2022/06/28.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "헬로우월드!" // 텍스트 입력
        label.textAlignment = .center // Label가운데정렬
        label.font = UIFont.boldSystemFont(ofSize: 50) // 텍스트 : Bold, 사이즈 : 50
        label.textColor = .white // 텍스트색깔 흰색
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red // 뷰 배경색을 red로
        view.addSubview(titleLabel) //view = 전체그림, view의 자식뷰로 titleLabel을 집어넣는다.
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false // AutoresizingMask ?????????
        //titleLabel의 x,y축가운데정렬의 제약조건을, 부모 view의 가운데정렬과 같이한다.
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

