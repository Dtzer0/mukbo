//
//  RequestViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/23.
//

import UIKit

class RequestViewController: UIViewController {

    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        //만약, 빈칸이 있다면 빈칸 채우라고 안내하기 ( 다채워졌다면 등록여부 묻는 Alert 띄우고 저장하고 tableview에 띄우기
        
        //확인 얼럿
        let alert = UIAlertController(title: "등록", message: "정말 등록하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
