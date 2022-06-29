//
//  ViewController.swift
//  QRCode_tutorial
//
//  Created by 안지훈 on 2022/06/28.
//

//product sheme aligent OS_ACTIVITY_MODE를 disable설정함

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {
   

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnQRCode: UIButton!
    
    //MARK: - 객체 초기화 진행
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            //
            // QR스캔 뷰 구성
            $0.showTorchButton        = true //
            $0.showSwitchCameraButton = false //화면 전환 버튼
            $0.showCancelButton       = false // 화면 취소 버튼
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    //MARK: - 오버라이드 메서드. // -뺴면 구분선이없다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // guard let 구문에서 옵셔널이 될 수 있는 부분을 guard let으로 묶어야 된다.
        guard let url = URL (string: "http://www.naver.com") else { return }
        //여기에 guard let requestObj...하면안됨
        let requestObj = URLRequest(url: url)
        webView.load(requestObj)
       
        // 버튼 가장자리 선 설정
        btnQRCode.layer.borderWidth = 1 // 볼드두꺠
        btnQRCode.layer.borderColor = UIColor.blue.cgColor // 볼드색깔
        btnQRCode.layer.cornerRadius = 10 // 가장자리 원형의 정도
        // #selector는 objective-c의 메서드임으로 #으로 표현 ?
        btnQRCode.addTarget(self, action: #selector(qrCodeReaderLaunch), for: .touchUpInside)
    }
    
    //MARK: - fileprivate메서드 : qr코드를 인식하고 인식에 실패했을 때 연결 설정한것
    @objc fileprivate func qrCodeReaderLaunch(){
        // QR콘텐츠검색
          // 델리게이트패턴을 사용하여색
          readerVC.delegate = self

          // 아니면 클로저패턴을 사용하여 검색
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            //result( url형식으로 들어옴 )가 값이 있는지 겁사
              guard let firstScanUrl = result?.value else { return }
              // result출력
              print(firstScanUrl)
              // URL타입으로 변경
              guard let scannedUrl : URL = URL(string: firstScanUrl) else { return }
              self.webView.load(URLRequest(url: scannedUrl))
          }
        // readerVC를 모달양식시트로 보여준다
          readerVC.modalPresentationStyle = .formSheet
         //설정 된 qr코드 ViewContoller를 화면에 보여준다.
          present(readerVC, animated: true, completion: nil)
        print("qrcode launch")
    }
    //MARK: - QRCodeDelegate메서드
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        //dismisss : 뷰컨트롤러해체(팝업창삭제), animaited : 동작할거냐 Bool타입, completion : 다음 실행할 블록
        dismiss(animated: true, completion: nil)
    
    }
    // MARK: - QR스캔 종료 액션
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

         dismiss(animated: true, completion: nil)
    }
}

// - 카메라사용하기위해
// info.plist 에서 privacy - cameradescription설정 : 카메라사용 권한 안내문구

// dismisss : 뷰컨트롤러해체 animaited : 동작할거냐 Bool타입, completion : 다음 실행할 블록
// dismiss(animated: true, completion: nil)

// 델리게이트 패턴??? 옵셔널패턴 ??

//btnQRCode.layer.borderWidth = 1 // 볼드두꺠
//btnQRCode.layer.borderColor = UIColor.blue.cgColor // 볼드색깔
//btnQRCode.layer.cornerRadius = 10 // 가장자리 원형의 정도
//// #selector는 objective-c의 메서드임으로 #으로 표현 ?
//btnQRCode.addTarget(self, action: #selector(qrCodeReaderLaunch), for: .touchUpInside)
// MARK: 자신 핸드폰으로 앱 접근권한 허용
// 일밥 -> VPN 및 기기관리 -> 개발자 앱 -> 해당앱 신뢰 터치
/*
    MARK: [QR 코드 스캔 필요 사항]
    1. info.plist 권한 : Privacy - Camera Usage Description
    2. 라이브러리 설치 git : https://github.com/yannickl/QRCodeReader.swift.git
    3. SPM 패키지 매니저 사용해 설치 시 참고 : branch >> 라이브러리 설치 진행
    4. 필요 import :
       - import AVFoundation
       - import QRCodeReader
    5. 필요 딜리게이트 : QRCodeReaderViewControllerDelegate
    6. 로직 :
      - 카메라 권한 상태 퍼미션 인증 확인
      - 카메라 호출 및 QR 스캔 시작 실시
      - QR 스캔 완료 시 카메라 활성 창 닫기 및 스캔 종료 실시
 
    //출처 : https://kkh0977.tistory.com/1353
*/

