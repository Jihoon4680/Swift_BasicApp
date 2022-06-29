//
//  ViewController.swift
//  NiceApp
//
//  Created by 안지훈 on 2022/06/28.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    let titleLabel : UILabel = {
        let label = UILabel()//UILabel의 인스턴스
        label.text = "메인화면"
        label.textColor = .black
        label.textAlignment = .center
        // 폰트 스타일을 지정 할 때는 UIFont를 써야되는데 이미지가 바뀌기 때문일까?
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    // 데이터타입으로의 함수인가.... = { } 이게 왜나오지...??
    // 함수를 사용한 클로저
    let animationView : AnimationView = {
        //애니메이션설정
        let animView = AnimationView(name: "12358-christmas-loading")
        //사각형 0,0에서부터 크기 400x400짜리 애니메이션설정
        animView.frame = CGRect(x:0,y:0,width: 400,height: 400)
        //animationView의 사이즈를 꽉차게 설정
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        // view의 자식뷰로 animationView 설정
        view.addSubview(animationView)
        animationView.center = view.center // 중앙 정렬
 
        //애니메이션 실행 closer안에서는 self.를 사용해줘야됨 ( MARK 참고 )
        animationView.play{ (finish) in
            //끝나게되면
            print("애니메이션이 끝났다.")
            // 부모뷰에서 지운다.
            self.animationView.removeFromSuperview()

            self.view.backgroundColor = .white
            self.view.addSubview(self.titleLabel)
            //텍스트라벨 사용하려면 translatesAutoresizingMaskIntoConstraints를 false로 설정해야됨
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            // titleLabel constraint 설정
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }
    }
}

// MARK: - 함수를 사용한 프로퍼티 기본 값 : = { }
// 변수나 상수의 타입과 함수의 반환타입이 같아야함.
// let animationView : AnimationView = {
//    //애니메이션설정
//    let animView = AnimationView(name: "12358-christmas-loading")
//    //사각형 0,0에서부터 크기 400x400짜리 애니메이션설정
//    animView.frame = CGRect(x:0,y:0,width: 400,height: 400)
//    //animationView의 사이즈를 꽉차게 설정
//    animView.contentMode = .scaleAspectFill
//    return animView
//}()

// MARK: - 클로저에서 self를 사용하는 이유\

