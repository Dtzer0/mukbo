//
//  SignViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/23.
//

import UIKit

class SignViewController: UIViewController {

    @IBAction func logoutBtn(_ sender: Any) {
        //카카오 로그아웃
        
        //확인 얼럿
        let alert = UIAlertController(title: "로그아웃", message: "진짜 로그아웃 하시겠어요?", preferredStyle: .alert)
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
