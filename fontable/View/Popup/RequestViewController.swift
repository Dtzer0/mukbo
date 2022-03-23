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
        //저장하고 tableview에 띄우기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
