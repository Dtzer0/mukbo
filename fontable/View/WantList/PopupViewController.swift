//
//  PopupViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/05/03.
//

import UIKit
import CoreData

class PopupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var foodName: UITextField?
    @IBOutlet weak var priceName: UITextField?
    @IBOutlet weak var brandName: UITextField?
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        //만약, 빈칸이 있다면 빈칸 채우라고 안내하기 ( 다채워졌다면 등록여부 묻는 Alert 띄우고 저장하고 tableview에 띄우기
        
        //확인 얼럿
        let alert = UIAlertController(title: "등록", message: "정말 등록하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .destructive) { [self](action) in
            
            //CoreData에 save ( 팝업창에 있는 textfield에 작성된 데이터를 CoreData에 save )
            DataManagers.shared.saveContext()
            
            //CoreData에 있는 save된 textfireld Data 가져오기
            DataManagers.shared.loadDatas()
            
            //팝업창 없앰
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodName?.delegate = self
        priceName?.delegate = self
        brandName?.delegate = self
    }
}

extension PopupViewController : UITextViewDelegate {
    //길이제한
}
